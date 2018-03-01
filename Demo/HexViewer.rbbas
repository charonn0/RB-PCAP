#tag Class
Protected Class HexViewer
Inherits Canvas
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  If Asc(key) = &h1F Then ' up arrow
		    If Not RaiseEvent Scrolled(1, BytesPerLine) Then
		      Me.Offset = Me.Offset + BytesPerLine
		    End If
		  ElseIf Asc(key) = &h1E Then ' down arrow
		    If Not RaiseEvent Scrolled(-1, BytesPerLine * -1) Then
		      Me.Offset = Me.Offset - BytesPerLine
		    End If
		  End If
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  Me.SelectionEnd = OffsetFromXY(X, Y)
		End Sub
	#tag EndEvent

	#tag Event
		Function MouseWheel(X As Integer, Y As Integer, deltaX as Integer, deltaY as Integer) As Boolean
		  #pragma Unused deltaX
		  #pragma Unused X
		  #pragma Unused Y
		  #pragma BackgroundTasks Off
		  If Buffer = Nil Then Return False
		  If Stream = Nil Then Return False
		  Dim data As String
		  Stream.Position = Offset
		  Do Until Buffer.Graphics.StringWidth(data) >= Buffer.Graphics.Width - Buffer.Graphics.StringWidth(" 00")
		    #If RBVersion > 2015 Then
		      Dim bt As Byte = Stream.ReadInt8
		    #Else
		      Dim bt As Byte = Stream.ReadByte
		    #endif
		    data = data + " " + Hex(bt, 2, LineNumbersLittleEndian) + " "
		  Loop
		  
		  Dim linedelta, bytesdelta As Integer
		  If Sign(deltaY) = 1 Then ' scroll down
		    For i As Integer = 0 To deltaY
		      bytesdelta = bytesdelta + BytesPerLine
		      linedelta = linedelta + 1
		    Next
		    
		  ElseIf Sign(deltaY) = -1 Then ' scroll up
		    
		    For i As Integer = deltaY To 0
		      bytesdelta = bytesdelta + BytesPerLine
		      linedelta = linedelta + 1
		    Next
		    
		    bytesdelta = bytesdelta * -1
		    linedelta = linedelta * -1
		    
		  End If
		  
		  If Not RaiseEvent Scrolled(linedelta, bytesdelta) Then
		    Me.Offset = Me.Offset + bytesdelta
		  End If
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  #If TargetLinux Then
		    Me.Enabled = False
		  #endif
		  Me.TextFont = FixedWidthFont
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics)
		  #If TargetWin32 Then
		    If Buffer = Nil Or Buffer.Width <> g.Width Or Buffer.Height <> g.Height Then
		      App.UseGDIPlus = False
		      Buffer = New Picture(g.Width, g.Height, 32)
		      Dim bg As Graphics = Buffer.Graphics
		  #else
		    Dim bg As Graphics = g
		  #endif
		  
		  g.AntiAlias = True
		  
		  bg.TextFont = Me.TextFont
		  
		  Dim BinWidth As Integer
		  Dim gw, rowoffset As Integer
		  Dim alt As Boolean
		  
		  If ShowOffsets Then
		    Dim tmp As String
		    For i As Integer = 1 To 4
		      tmp = tmp + "0"
		    Next
		    gw = bg.StringWidth(tmp) + 1
		    'TopGutterGraphics = g.Clip(0, 0, g.Width, g.StringHeight("0x00000000", 99)) 'broken right now
		    TopGutterGraphics = bg.Clip(0, 0, 0, 0)
		  Else
		    gw = 0
		    TopGutterGraphics = bg.Clip(0, 0, 0, 0)
		  End If
		  
		  ' Construct the subordinate Graphics objects
		  TopGutterGraphics.TextSize = 0.75 * Me.TextSize
		  GutterGraphics = bg.Clip(0, TopGutterGraphics.Height, gw, bg.Height - TopGutterGraphics.Height)
		  If ShowOffsets Then
		    BinWidth = (0.75 * Me.Width) - GutterGraphics.Width + bg.StringWidth(" ")
		  Else
		    BinWidth = (0.75 * Me.Width) - GutterGraphics.Width
		  End If
		  BinGraphics = bg.Clip(GutterGraphics.Width, TopGutterGraphics.Height, BinWidth, bg.Height - TopGutterGraphics.Height)
		  Dim TextWidth As Integer = Me.Width - BinWidth - GutterGraphics.Width
		  TextGraphics = bg.Clip(BinWidth + GutterGraphics.Width, TopGutterGraphics.Height, TextWidth, bg.Height - TopGutterGraphics.Height)
		  ' end Graphics' construct
		  
		  
		  Dim TextHeight, row, column, bytewidth As Integer
		  Dim data, txt, hx As String
		  bytewidth = BinGraphics.StringWidth(".00")
		  row = LineFromOffset(Offset)
		  mVisibleByteCount = 0
		  If Stream <> Nil Then
		    Stream.Position = Offset
		    Do Until TextHeight > BinGraphics.Height Or Stream.EOF
		      rowoffset = Stream.Position
		      Do Until BinGraphics.StringWidth(data) >= BinGraphics.Width - bytewidth
		        If Stream.EOF Then
		          data = data + " "
		          mVisibleByteCount = mVisibleByteCount + 1
		          Exit Do
		        End If
		        mVisibleByteCount = mVisibleByteCount + 1
		        #If RBVersion > 2015 Then
		          Dim bt As Byte = Stream.ReadUInt8
		        #Else
		          Dim bt As Byte = Stream.ReadByte
		        #endif
		        hx = Hex(bt, 2, BytesLittleEndian)
		        data = data + " " + hx' + " "
		        If bt < 33 Or bt > 127 Then
		          txt = txt + "."
		        Else
		          If Me.Encoding <> Nil Then
		            txt = txt + Me.Encoding.Chr(bt).Trim
		          Else
		            txt = txt + Chr(bt).Trim
		          End If
		        End If
		        If row = 0 Then
		          Dim header As String = Hex(column, 2, LineNumbersLittleEndian)
		          Dim headerstart As Integer = GutterGraphics.Width + (bytewidth * column) + BinGraphics.StringWidth(" 00 ")
		          TopGutterGraphics.DrawString(" " + header, headerstart, TopGutterGraphics.Height)
		        End If
		        column = column + 1
		      Loop
		      
		      column = 1
		      TextHeight = TextHeight + LineHeight
		      If row Mod 2 = 0 Then
		        BinGraphics.Forecolor = ByteBackgroundColorAlt
		        TextGraphics.Forecolor = TextBackGroundColorAlt
		        GutterGraphics.ForeColor = GutterColorAlt
		      Else
		        BinGraphics.Forecolor = ByteBackgroundColor
		        TextGraphics.Forecolor = TextBackGroundColor
		        GutterGraphics.ForeColor = GutterColor
		      End If
		      'alt = Not alt
		      
		      BinGraphics.FillRect(0, TextHeight - LineHeight, BinGraphics.Width, LineHeight)
		      TextGraphics.FillRect(0, TextHeight - LineHeight, TextGraphics.Width, LineHeight)
		      GutterGraphics.FillRect(0, TextHeight - LineHeight, GutterGraphics.Width, LineHeight)
		      
		      TextGraphics.ForeColor = TextColor
		      BinGraphics.ForeColor = ByteColor
		      BinGraphics.DrawString(data, 0, TextHeight - 2)
		      TextGraphics.DrawString(txt, 0, TextHeight - 2)
		      GutterGraphics.ForeColor = LineNumbersColor
		      'Dim linenumber As String = Hex(rowoffset, 4, LineNumbersLittleEndian)
		      GutterGraphics.DrawString(Right("00000" + Hex(rowoffset), 5), 0, TextHeight - 2)
		      
		      data = ""
		      txt = ""
		      row = row + 1
		    Loop
		    If SelectionStart >= 0 And SelectionEnd > SelectionStart And SelectionEnd > Me.Offset Then
		      Dim x As Int64 = Max(SelectionStart, Me.Offset)
		      Dim l As Integer = LineFromOffset(x)
		      Dim h As Integer = l * LineHeight
		      Dim df As Integer = x - SelectionEnd
		      If df > BytesPerLine Then
		        BinGraphics.ForeColor = &c0080FF00
		        BinGraphics.FillRect(0, h - LineHeight, BinGraphics.Width, h)
		      Else
		        df = df * BytesPerLine
		        BinGraphics.ForeColor = &c0080FF00
		        BinGraphics.FillRect(0, h - LineHeight, x + df, h)
		      End If
		    End If
		  Else ' No stream
		    Do Until TextHeight > BinGraphics.Height
		      If row = 0 Then
		        Dim header As String = Hex(column, 2, LineNumbersLittleEndian)
		        Dim headerstart As Integer = GutterGraphics.Width + (bytewidth * column) + BinGraphics.StringWidth(" 00 ")
		        TopGutterGraphics.DrawString(" " + header, headerstart, TopGutterGraphics.Height)
		      End If
		      TextHeight = TextHeight + LineHeight
		      If alt Then
		        BinGraphics.Forecolor = ByteBackgroundColorAlt
		        TextGraphics.Forecolor = TextBackGroundColorAlt
		        GutterGraphics.ForeColor = GutterColorAlt
		      Else
		        BinGraphics.Forecolor = ByteBackgroundColor
		        TextGraphics.Forecolor = TextBackGroundColor
		        GutterGraphics.ForeColor = GutterColor
		      End If
		      alt = Not alt
		      
		      BinGraphics.FillRect(0, TextHeight - LineHeight, BinGraphics.Width, LineHeight)
		      TextGraphics.FillRect(0, TextHeight - LineHeight, TextGraphics.Width, LineHeight)
		      GutterGraphics.FillRect(0, TextHeight - LineHeight, GutterGraphics.Width, LineHeight)
		      GutterGraphics.ForeColor = LineNumbersColor
		      Dim linenumber As String = Hex(rowoffset, 8, LineNumbersLittleEndian)
		      GutterGraphics.DrawString(linenumber, 0, TextHeight - 1)
		    Loop
		  End If
		  
		  bg.ForeColor = GutterColor
		  bg.FillRect(0, TextHeight, bg.Width, bg.Height - TextHeight)
		  bg.ForeColor = Me.BorderColor
		  bg.DrawLine(BinGraphics.Width + GutterGraphics.Width - 1, 0, BinGraphics.Width + GutterGraphics.Width - 1, BinGraphics.Height)
		  bg.DrawLine(GutterGraphics.Width - 1, 0, GutterGraphics.Width - 1, BinGraphics.Height)
		  If Me.Border Then
		    bg.DrawRect(0, 0, bg.Width, bg.Height)
		  End If
		  #If TargetWin32 Then
		    End If
		    g.DrawPicture(Buffer, 0, 0)
		  #endif
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function BytesPerLine() As Integer
		  ' the number of bytes each line represents
		  Dim data As String
		  Dim g As Graphics = BinGraphics
		  Dim count As Integer
		  Do Until g.StringWidth(data) >= BinGraphics.Width - g.StringWidth(" 00")
		    data = data + " 00"
		    count = count + 1
		  Loop
		  Return count
		  
		Exception Err As NilObjectException
		  Return 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Function FixedWidthFont() As String
		  ' try to pick a fixed-width font
		  
		  Static mFont As String
		  If mFont <> "" Then Return mFont
		  Dim preferred() As String = Split("Consolas,Anonymous,Courier,Inconsolata,Lucida Console,Monospace", ",")
		  For i As Integer = FontCount - 1 DownTo 0
		    Dim fontname As String = Font(i)
		    If Left(fontname, 1) = "@" Then Continue
		    For Each pref As String In preferred
		      If fontname = pref Then
		        mFont = fontname
		        Return mFont
		      End If
		    Next
		    Dim tmp As New Picture(64, 64, 24)
		    tmp.Graphics.TextFont = fontname
		    Dim a, b As Double
		    a = tmp.Graphics.StringWidth("i")
		    b = tmp.Graphics.StringWidth("A")
		    If a = b Then
		      mFont = fontname
		      Exit For
		    End If
		  Next
		  Return mFont
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Function Hex(Data As Integer, Width As Integer = 2, LittleEndian As Boolean) As String
		  Dim tmp As String
		  For i As Integer = 1 To Width
		    tmp = tmp + "0"
		  Next
		  Dim number As String = Left(REALbasic.Hex(Data) + tmp, Width)
		  If TargetLittleEndian Then
		    If Not LittleEndian Then number = StrReverse(number)
		  Else
		    If LittleEndian Then number = StrReverse(number)
		  End If
		  Return number
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LineCount() As Integer
		  If Stream = Nil Then Return 0
		  If mStreamLen Mod BytesPerLine = 0 Then
		    Return mStreamLen \ BytesPerLine
		  Else
		    Return (mStreamLen \ BytesPerLine) + 1
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LineFromOffset(BytesOffset As UInt64) As Integer
		  If BytesOffset Mod BytesPerLine = 0 Then
		    Return BytesOffset \ BytesPerLine
		  Else
		    Return (BytesOffset \ BytesPerLine) + 1
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LineHeight() As Integer
		  Return BinGraphics.StringHeight("00", BinGraphics.Width)
		  
		Exception Err As NilObjectException
		  Return 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OffsetFromLine(Line As Integer) As UInt64
		  Return BytesPerLine * Line
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OffsetFromXY(X As Integer, Y As Integer) As UInt64
		  If Stream = Nil Then Return -1
		  'Dim row As Integer = Y \ LineHeight
		  'Dim column As Integer = X \ BinGraphics.Width
		  'Dim oldoffset As UInt64 = Me.Offset
		  'Stream.Position = Me.Offset
		  'For a As Integer = 0 To row
		  'For b As Integer = 0 To column
		  'If a = row And b = column Then
		  'Dim ret As Int64 = Stream.Position + 1
		  'Stream.Position = oldoffset
		  'Return ret
		  'Else
		  'Call Stream.ReadByte
		  'End If
		  'Next
		  'Next
		  '
		  'Stream.Position = oldoffset
		  'Return -1
		  
		  Dim line As Integer = Y \ LineHeight
		  Dim o As Integer = OffsetFromLine(line)
		  Stream.Position = o
		  Dim w, bytewidth As Integer
		  Dim pos As Int64 = -1
		  bytewidth = BinGraphics.StringWidth(".00")
		  'w = bytewidth
		  For i As Integer = 1 To BytesPerLine
		    If Stream.EOF Then
		      Stream.Position = Offset
		      Exit For
		    End If
		    Call Stream.ReadUInt8
		    If X > w And X < w + bytewidth Then
		      pos = Stream.Position
		      Stream.Position = Offset
		      Exit For
		    End If
		    w = w + bytewidth
		  Next
		  Return pos
		  
		  
		  
		  
		Exception Err As NilObjectException
		  Return 0
		  
		  
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowData(DataStream As BinaryStream, DataLength As Integer = - 1)
		  Me.Stream = DataStream
		  Me.Stream.Position = 0
		  mStreamLen = DataLength
		  Offset = 0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Function StrReverse(InputData As String) As String
		  Dim output As String = DefineEncoding("", InputData.Encoding)
		  For i As Integer = InputData.Len DownTo 1
		    output = output + Mid(InputData, i, 1)
		  Next
		  Return output
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Update(AndInvalidate As Boolean)
		  Buffer = Nil
		  If AndInvalidate Then Invalidate(False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VisibleByteCount() As Integer
		  If mVisibleByteCount > 0 Then Break
		  Return mVisibleByteCount
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VisibleLineCount() As Integer
		  Dim h As Integer = LineHeight
		  Return BinGraphics.Height \ h
		  
		Exception Err As NilObjectException
		  Return 0
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Scrolled(LinesDelta As Integer, BytesDelta As Integer) As Boolean
	#tag EndHook


	#tag Property, Flags = &h21
		Private BinGraphics As Graphics
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mbold
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mbold = value
			  Me.Update(True)
			End Set
		#tag EndSetter
		Bold As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mBorder
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mBorder = value
			  Me.Update(True)
			End Set
		#tag EndSetter
		Border As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mBorderColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mBorderColor = value
			  Me.Update(True)
			End Set
		#tag EndSetter
		BorderColor As Color
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected Buffer As Picture
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mByteBackgroundColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mByteBackgroundColor = value
			  Me.Update(True)
			End Set
		#tag EndSetter
		ByteBackgroundColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mByteBackgroundColorAlt
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mByteBackgroundColorAlt = value
			  Me.Update(True)
			End Set
		#tag EndSetter
		ByteBackgroundColorAlt As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mByteColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mByteColor = value
			  Me.Update(True)
			End Set
		#tag EndSetter
		ByteColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mBytesLittleEndian
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mBytesLittleEndian = value
			  Me.Update(True)
			End Set
		#tag EndSetter
		BytesLittleEndian As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mEncoding
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mEncoding = value
			  Me.Update(True)
			End Set
		#tag EndSetter
		Encoding As TextEncoding
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mGutterColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mGutterColor = value
			  Me.Update(True)
			End Set
		#tag EndSetter
		GutterColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mGutterColorAlt
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mGutterColorAlt = value
			  Me.Update(True)
			End Set
		#tag EndSetter
		GutterColorAlt As Color
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private GutterGraphics As Graphics
	#tag EndProperty

	#tag Property, Flags = &h0
		Hilight As Boolean
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mitalic
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mitalic = value
			  Me.Update(True)
			End Set
		#tag EndSetter
		Italic As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mLineNumbersColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mLineNumbersColor = value
			  Me.Update(True)
			End Set
		#tag EndSetter
		LineNumbersColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mLineNumbersLittleEndian
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mLineNumbersLittleEndian = value
			  Me.Update(True)
			End Set
		#tag EndSetter
		LineNumbersLittleEndian As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mbold As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mBorder As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mBorderColor As Color = &c808080
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mByteBackgroundColor As Color = &cFFFFFF00
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mByteBackgroundColorAlt As Color = &cEAFFFF00
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mByteColor As Color
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mBytesLittleEndian As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mEncoding As TextEncoding
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mGutterColor As Color = &cC0C0C000
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mGutterColorAlt As Color
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mitalic As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLineNumbersColor As Color = &c0000FF00
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLineNumbersLittleEndian As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mOffset As UInt64
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSelectionEnd As Int64 = -1
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSelectionStart As Int64 = -1
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mShowOffsets As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mStreamLen As UInt64
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTextBackGroundColor As Color = &cFFFFFF00
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTextBackGroundColorAlt As Color = &cEAFFFF00
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mtextColor As Color = &c000000
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mtextFont As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mtextSize As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private munderline As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mVisibleByteCount As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mOffset
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If Stream = Nil Or value >= mStreamLen Then Return
			  mOffset = value
			  Buffer = Nil
			  Me.Update(True)
			End Set
		#tag EndSetter
		Offset As UInt64
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mSelectionEnd
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mSelectionEnd = value
			  Me.Update(True)
			End Set
		#tag EndSetter
		SelectionEnd As Int64
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mSelectionStart
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mSelectionStart = value
			  Me.Update(True)
			End Set
		#tag EndSetter
		SelectionStart As Int64
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mShowOffsets
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mShowOffsets = value
			  Me.Update(True)
			End Set
		#tag EndSetter
		ShowOffsets As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected Stream As BinaryStream
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mStreamLen
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mStreamLen = value
			  Me.Update(True)
			End Set
		#tag EndSetter
		StreamLen As UInt64
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mTextBackGroundColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mTextBackGroundColor = value
			  Me.Update(True)
			End Set
		#tag EndSetter
		TextBackGroundColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mTextBackGroundColorAlt
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mTextBackGroundColorAlt = value
			  Update(True)
			End Set
		#tag EndSetter
		TextBackGroundColorAlt As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mtextColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mtextColor = value
			  Update(True)
			End Set
		#tag EndSetter
		TextColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mtextFont
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mtextFont = value
			  Me.Update(True)
			End Set
		#tag EndSetter
		TextFont As String
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private TextGraphics As Graphics
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mtextSize
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mtextSize = value
			  Me.Update(True)
			End Set
		#tag EndSetter
		TextSize As Single
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private TopGutterGraphics As Graphics
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AcceptFocus"
			Visible=true
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AcceptTabs"
			Visible=true
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backdrop"
			Visible=true
			Group="Appearance"
			Type="Picture"
			EditorType="Picture"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Bold"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Border"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BorderColor"
			Visible=true
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ByteBackgroundColor"
			Visible=true
			Group="Behavior"
			InitialValue="&cFFFFFF00"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ByteBackgroundColorAlt"
			Visible=true
			Group="Behavior"
			InitialValue="&cC0C0C000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ByteColor"
			Visible=true
			Group="Behavior"
			InitialValue="&c0000FF00"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BytesLittleEndian"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleBuffer"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EraseBackground"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="GutterColor"
			Visible=true
			Group="Behavior"
			InitialValue="&cFFFFFF00"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="GutterColorAlt"
			Visible=true
			Group="Behavior"
			InitialValue="&cC0C0C000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HelpTag"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Hilight"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Group="Initial State"
			Type="String"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Italic"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LineNumbersColor"
			Visible=true
			Group="Behavior"
			InitialValue="&c80000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LineNumbersLittleEndian"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ShowOffsets"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextBackGroundColor"
			Visible=true
			Group="Behavior"
			InitialValue="&cFFFFFF00"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextBackGroundColorAlt"
			Visible=true
			Group="Behavior"
			InitialValue="&cC0C0C000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextColor"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextFont"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextSize"
			Group="Behavior"
			Type="Single"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UseFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
