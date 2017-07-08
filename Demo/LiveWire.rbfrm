#tag Window
Begin Window LiveWire
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   400
   ImplicitInstance=   False
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   ""
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   2
   Resizeable      =   True
   Title           =   "Live wire"
   Visible         =   True
   Width           =   600
   Begin HexViewer HexViewer1
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AutoDeactivate  =   True
      Backdrop        =   ""
      Bold            =   ""
      Border          =   True
      BorderColor     =   &h00C0C0C0
      ByteBackgroundColor=   "&cFFFFFF00"
      ByteBackgroundColorAlt=   "&cFFFFFF00"
      ByteColor       =   "&c0000FF00"
      BytesLittleEndian=   True
      DoubleBuffer    =   True
      Enabled         =   True
      EraseBackground =   False
      GutterColor     =   "&cFFFFFF00"
      GutterColorAlt  =   "&cFFFFFF00"
      Height          =   400
      HelpTag         =   ""
      Hilight         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   0
      LineNumbersColor=   "&c80000000"
      LineNumbersLittleEndian=   False
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      ShowOffsets     =   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextBackGroundColor=   "&cFFFFFF00"
      TextBackGroundColorAlt=   "&cFFFFFF00"
      TextFont        =   "System"
      TextSize        =   0
      Top             =   0
      UseFocusRing    =   True
      Visible         =   True
      Width           =   600
   End
   Begin Timer Timer1
      Height          =   32
      Index           =   -2147483648
      Left            =   675
      LockedInPosition=   False
      Mode            =   0
      Period          =   100
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   142
      Width           =   32
   End
   Begin ScrollBar ScrollBar1
      AcceptFocus     =   true
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   400
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   608
      LineStep        =   1
      LiveScroll      =   ""
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Maximum         =   100
      Minimum         =   0
      PageStep        =   20
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Value           =   0
      Visible         =   True
      Width           =   16
   End
   Begin PCAP.PacketFilter PacketSource
      Height          =   32
      Index           =   -2147483648
      Left            =   675
      LockedInPosition=   False
      Priority        =   ""
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   184
      Width           =   32
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  If mPacketStream <> Nil Then mPacketStream.Close
		  mPacketMB = Nil
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub ShowAdaptor(Adaptor As PCAP.Adaptor, Expression As String)
		  Self.Title = "Live wire - " + Adaptor.Name
		  mCapture = PCAP.BeginCapture(Adaptor, True, PCAP.MAX_SNAP_LENGTH, 10)
		  If Expression.Trim <> "" And PCAP.IsValidFilter(Expression) Then mCapture.CurrentFilter = PCAP.Filter.Compile(Expression, mCapture)
		  Timer1.Mode = Timer.ModeMultiple
		  PacketSource.Source = mCapture
		  PacketSource.Start
		  Self.Show
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mCapture As PCAP.Capture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCount As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPacketMB As MemoryBlock
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPackets() As PCAP.Packet
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPacketStream As BinaryStream
	#tag EndProperty


#tag EndWindowCode

#tag Events HexViewer1
	#tag Event
		Function Scrolled(LinesDelta As Integer, BytesDelta As Integer) As Boolean
		  #pragma Unused BytesDelta
		  ScrollBar1.Maximum = HexViewer1.LineCount - (HexViewer1.VisibleLineCount \ 2)
		  ScrollBar1.Value = ScrollBar1.Value + LinesDelta
		  Return True ' Since we're updating the offset in ScrollBar1.ValueChanged, we return true to prevent the HexViewer from updating it too.
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events Timer1
	#tag Event
		Sub Action()
		  If mPacketStream = Nil Then
		    mPacketMB = New MemoryBlock(0)
		    mPacketStream = New BinaryStream(mPacketMB)
		    HexViewer1.ShowData(mPacketStream)
		  ElseIf mPacketStream.Length > 1024 * 64 Then
		    mPacketStream.Close
		    mPacketMB = RightB(mPacketMB, 1024 * 32)
		    mPacketStream = New BinaryStream(mPacketMB)
		    HexViewer1.ShowData(mPacketStream)
		    
		  End If
		  
		  If mCapture = Nil Then Return
		  Dim offset As UInt64 = HexViewer1.Offset
		  Dim added As Boolean
		  mPacketStream.Position = mPacketStream.Length
		  Do Until UBound(mPackets) = -1
		    Dim p As PCAP.Packet = mPackets.Pop
		    mPacketStream.Write(p.StringValue)
		    offset = offset + p.SnapLength
		    mCount = mCount + 1
		    added = True
		  Loop
		  If Added Then
		    offset = mPacketStream.Position - (HexViewer1.BytesPerLine * HexViewer1.VisibleLineCount) + HexViewer1.BytesPerLine
		    If offset > mPacketStream.Length Then offset = mPacketStream.Length - (HexViewer1.BytesPerLine * HexViewer1.VisibleLineCount)
		    System.DebugLog("Setting an offset of  " + str(offset) + " for a length of " + Str(mPacketStream.Length))
		    HexViewer1.Offset = offset
		  End If
		  Self.Title = "Live wire - " + mCapture.Source.Name + "(" + Format(mCount, "###,###,###,##0") + ")"
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ScrollBar1
	#tag Event
		Sub ValueChanged()
		  HexViewer1.Offset = Me.Value * HexViewer1.BytesPerLine
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PacketSource
	#tag Event
		Sub PacketArrived(NewPacket As PCAP.Packet)
		  mPackets.Insert(0, NewPacket)
		End Sub
	#tag EndEvent
#tag EndEvents
