#tag Window
Begin Window CapWindow
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   3
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   2.7e+2
   ImplicitInstance=   False
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   ""
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   False
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "Capturing - Untitled.pcap"
   Visible         =   True
   Width           =   5.51e+2
   Begin Label Label1
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   0
      TabPanelIndex   =   0
      Text            =   "Adaptor:"
      TextAlign       =   2
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   6
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   65
   End
   Begin Label Label2
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      Text            =   "Packets:"
      TextAlign       =   2
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   30
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   65
   End
   Begin Label Label3
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   172
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      Text            =   "Dropped:"
      TextAlign       =   2
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   30
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   65
   End
   Begin Label AdaptorPath
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   77
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      Text            =   "rpcap://sdfsdf"
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   6
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   474
   End
   Begin Label PacketCount
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   77
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      Text            =   0
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   30
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   91
   End
   Begin Label DropCount
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   249
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   5
      TabPanelIndex   =   0
      Text            =   0
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   30
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   123
   End
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Stop"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   278
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   69
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin Timer Timer1
      Height          =   32
      Index           =   -2147483648
      Left            =   -44
      LockedInPosition=   False
      Mode            =   0
      Period          =   100
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   -18
      Width           =   32
   End
   Begin Thread CapThread
      Height          =   32
      Index           =   -2147483648
      Left            =   -44
      LockedInPosition=   False
      Priority        =   1
      Scope           =   0
      StackSize       =   0
      TabPanelIndex   =   0
      Top             =   25
      Width           =   32
   End
   Begin PushButton PushButton2
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Pause"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   193
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   69
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin Listbox PacketList
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   ""
      Border          =   True
      ColumnCount     =   1
      ColumnsResizable=   ""
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   ""
      EnableDragReorder=   ""
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   ""
      HeadingIndex    =   -1
      Height          =   156
      HelpTag         =   ""
      Hierarchical    =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   ""
      Left            =   7
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      RequiresSelection=   ""
      Scope           =   0
      ScrollbarHorizontal=   ""
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   103
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   225
      _ScrollWidth    =   -1
   End
   Begin HexViewer PacketView
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AutoDeactivate  =   True
      Backdrop        =   ""
      Bold            =   ""
      Border          =   ""
      ByteBackgroundColor=   "&cFFFFFF00"
      ByteBackgroundColorAlt=   "&cC0C0C000"
      ByteColor       =   "&c0000FF00"
      BytesLittleEndian=   True
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      GutterColor     =   "&cFFFFFF00"
      GutterColorAlt  =   "&cC0C0C000"
      Height          =   156
      HelpTag         =   ""
      Hilight         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   237
      LineNumbersColor=   "&c80000000"
      LineNumbersLittleEndian=   False
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      ShowOffsets     =   ""
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      TextBackGroundColor=   "&cFFFFFF00"
      TextBackGroundColorAlt=   "&cC0C0C000"
      TextSize        =   ""
      Top             =   103
      UseFocusRing    =   True
      Visible         =   True
      Width           =   306
   End
   Begin Label ByteCount
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   77
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   10
      TabPanelIndex   =   0
      Text            =   0
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   50
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   91
   End
   Begin Label Label4
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   11
      TabPanelIndex   =   0
      Text            =   "Byte count:"
      TextAlign       =   2
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   50
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   65
   End
   Begin CheckBox Autoscroll
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Autoscroll"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   20
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      State           =   1
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   71
      Underline       =   ""
      Value           =   True
      Visible         =   True
      Width           =   100
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Function CancelClose(appQuitting as Boolean) As Boolean
		  #pragma Unused appQuitting
		  If mCapture <> Nil Then
		    Return MsgBox("Confirm close?", 4 + 48, "Capture in progress") <> 6
		  End If
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub Close()
		  Timer1.Mode = Timer.ModeOff
		  If CapThread <> Nil And CapThread.State = Thread.Running Then CapThread.Kill
		  If mCapture <> Nil Then mCapture.Close
		  If mDump <> Nil Then mDump.Close
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub BeginCapture(ActiveCapture As PCAP.Capture, SaveTo As FolderItem)
		  mCapture = ActiveCapture
		  mCapLock = New Semaphore
		  If SaveTo <> Nil Then
		    mDump = New PCAP.DumpFile(ActiveCapture, SaveTo)
		    Self.Title = "Capturing to '" + SaveTo.Name + "'"
		  Else
		    Self.Title = "Capturing on '" + ActiveCapture.Source.Name + "'"
		  End If
		  Timer1.Mode = Timer.ModeMultiple
		  
		  Self.Show
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FormatBytes(bytes As UInt64, precision As Integer = 2) As String
		  'Converts raw byte counts into SI formatted strings. 1KB = 1024 bytes.
		  'Optionally pass an integer representing the number of decimal places to return. The default is two decimal places. You may specify
		  'between 0 and 16 decimal places. Specifying more than 16 will append extra zeros to make up the length. Passing 0
		  'shows no decimal places and no decimal point.
		  
		  Const kilo = 1024
		  Static mega As UInt64 = kilo * kilo
		  Static giga As UInt64 = kilo * mega
		  Static tera As UInt64 = kilo * giga
		  Static peta As UInt64 = kilo * tera
		  Static exab As UInt64 = kilo * peta
		  
		  Dim suffix, precisionZeros As String
		  Dim strBytes As Double
		  
		  
		  If bytes < kilo Then
		    strbytes = bytes
		    If bytes = 1 Then suffix = " byte" Else suffix = " bytes"
		    precision = 0
		  ElseIf bytes >= kilo And bytes < mega Then
		    strbytes = bytes / kilo
		    suffix = "KB"
		  ElseIf bytes >= mega And bytes < giga Then
		    strbytes = bytes / mega
		    suffix = "MB"
		  ElseIf bytes >= giga And bytes < tera Then
		    strbytes = bytes / giga
		    suffix = "GB"
		  ElseIf bytes >= tera And bytes < peta Then
		    strbytes = bytes / tera
		    suffix = "TB"
		  ElseIf bytes >= tera And bytes < exab Then
		    strbytes = bytes / peta
		    suffix = "PB"
		  ElseIf bytes >= exab Then
		    strbytes = bytes / exab
		    suffix = "EB"
		  End If
		  
		  
		  While precisionZeros.Len < precision
		    precisionZeros = precisionZeros + "0"
		  Wend
		  If precisionZeros.Trim <> "" Then precisionZeros = "." + precisionZeros
		  
		  Return Format(strBytes, "#,###0" + precisionZeros) + suffix
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub OpenCapture(ActiveCapture As PCAP.Capture)
		  mCapture = ActiveCapture
		  mCapLock = New Semaphore
		  Self.Title = "Reading capture file"
		  'Timer1.Mode = Timer.ModeMultiple
		  
		  'DropCount.Text = Format(mCapture.DropCount, "###,###,###,##0")
		  'PacketCount.Text = Format(mCapture.PacketCount, "###,###,###,##0")
		  Dim c As Integer = PacketList.ListCount
		  Dim added As Boolean
		  Do Until mCapture.EOF
		    Dim p As PCAP.Packet = mCapture.ReadNext
		    If p = Nil Then Continue
		    PacketList.AddRow("#" + Format(c, "###,###,###,##0") + " (" + FormatBytes(p.SnapLength) + ")")
		    PacketList.RowTag(c) = p
		    c = c + 1
		    added = True
		  Loop
		  If added Then PacketList.ScrollPosition = c
		  Self.Show
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mByteCount As UInt64
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCapLock As Semaphore
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCapture As PCAP.Capture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDump As PCAP.DumpFile
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPackets() As PCAP.Packet
	#tag EndProperty


#tag EndWindowCode

#tag Events PushButton1
	#tag Event
		Sub Action()
		  Do Until mCapLock.TrySignal
		    App.YieldToNextThread
		  Loop
		  Try
		    If CapThread.State = Thread.Running Then
		      CapThread.Suspend
		      PushButton2.Caption = "Start"
		    End If
		    If mDump <> Nil Then mDump.Flush
		  Finally
		    mCapLock.Release
		  End Try
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Timer1
	#tag Event
		Sub Action()
		  If mCapture = Nil Then Return
		  If Not mCapLock.TrySignal Then Return
		  If CapThread.State = Thread.Suspended Then 
		    CapThread.Resume 
		  ElseIf CapThread.State <> Thread.Running Then 
		    CapThread.Run
		  End If
		  Try
		    If mCapture.Source <> Nil Then AdaptorPath.Text = mCapture.Source.Name
		    DropCount.Text = Format(mCapture.DropCount, "###,###,###,##0")
		    PacketCount.Text = Format(mCapture.PacketCount, "###,###,###,##0")
		    'PacketList.Visible = False
		    PacketList.Enabled = False
		    Dim c As Integer = PacketList.ListCount
		    Dim added As Boolean
		    Do Until UBound(mPackets) = -1
		      Dim p As PCAP.Packet = mPackets.Pop
		      'PacketList.AddRow("#" + Format(c, "###,###,###,##0") + " (" + FormatBytes(p.SnapLength) + ")")
		      PacketList.AddRow("+" + Format(p.TimeStamp - mCapture.Epoch, "0.0###") + " (" + FormatBytes(p.SnapLength) + ")")
		      mByteCount = mByteCount + p.Length
		      PacketList.RowTag(c) = p
		      c = c + 1
		      added = True
		    Loop
		    If Autoscroll.Value And added Then PacketList.ScrollPosition = c
		    'PacketList.Visible = True
		    PacketList.Enabled = True
		    ByteCount.Text = FormatBytes(mByteCount)
		  Finally
		    mCapLock.Release
		  End Try
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CapThread
	#tag Event
		Sub Run()
		  Do
		    If mCapLock = Nil Then Continue
		    Do Until mCapLock.TrySignal
		      App.YieldToNextThread
		    Loop
		    Try
		      Dim p As PCAP.Packet = mCapture.ReadNext()
		      If p <> Nil Then 
		        If mDump <> Nil Then mDump.WritePacket(p)
		        mPackets.Append(p)
		      End If
		    Finally
		      mCapLock.Release
		    End Try
		    App.YieldToNextThread
		  Loop
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton2
	#tag Event
		Sub Action()
		  If CapThread.State = Thread.Suspended Then
		    CapThread.Resume
		    Me.Caption = "Pause"
		  Else
		    CapThread.Suspend
		    Me.Caption = "Resume"
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PacketList
	#tag Event
		Sub Change()
		  If Me.ListIndex <> -1 Then
		    Dim p As PCAP.Packet = Me.RowTag(Me.ListIndex)
		    PacketView.ShowData(New BinaryStream(p), p.SnapLength)
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
