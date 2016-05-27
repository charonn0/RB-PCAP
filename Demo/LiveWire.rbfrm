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
      Border          =   ""
      ByteBackgroundColor=   "&cFFFFFF00"
      ByteBackgroundColorAlt=   "&cC0C0C000"
      ByteColor       =   "&c0000FF00"
      BytesLittleEndian=   True
      DoubleBuffer    =   True
      Enabled         =   True
      EraseBackground =   False
      GutterColor     =   "&cFFFFFF00"
      GutterColorAlt  =   "&cC0C0C000"
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
      ShowOffsets     =   True
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextBackGroundColor=   "&cFFFFFF00"
      TextBackGroundColorAlt=   "&cC0C0C000"
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
   Begin Thread CapThread
      Height          =   32
      Index           =   -2147483648
      Left            =   675
      LockedInPosition=   False
      Priority        =   1
      Scope           =   0
      StackSize       =   0
      TabPanelIndex   =   0
      Top             =   185
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
		Sub ShowAdaptor(Adaptor As PCAP.Adaptor)
		  Self.Title = "Live wire - " + Adaptor.Name
		  mCapLock = New Semaphore
		  mCapture = PCAP.BeginCapture(Adaptor, True, PCAP.MAX_SNAP_LENGTH, 50)
		  Timer1.Mode = Timer.ModeMultiple
		  Self.Show
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mCapLock As Semaphore
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCapture As PCAP.Capture
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
		  End If
		  
		  If mCapture = Nil Then Return
		  If Not mCapLock.TrySignal Then Return
		  If CapThread.State = Thread.Suspended Then
		    CapThread.Resume
		  ElseIf CapThread.State <> Thread.Running Then
		    CapThread.Run
		  End If
		  Dim offset As UInt64 = HexViewer1.Offset
		  Dim added As Boolean
		  Try
		    mPacketStream.Position = mPacketStream.Length
		    Do Until UBound(mPackets) = -1
		      Dim p As PCAP.Packet = mPackets.Pop
		      mPacketStream.Write(p.StringValue)
		      offset = offset + p.SnapLength
		      added = True
		    Loop
		  Finally
		    mCapLock.Release
		  End Try
		  If Added Then
		    Dim lastline As Integer = HexViewer1.LineFromOffset(Max(offset - (HexViewer1.BytesPerLine * 1), 0))
		    offset = HexViewer1.OffsetFromLine(lastline)
		    System.DebugLog("Setting an offset of  " + str(offset) + " for a length of " + Str(mPacketStream.Length))
		    HexViewer1.Offset = offset
		  End If
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
		      If p <> Nil Then mPackets.Append(p) Else App.YieldToNextThread
		    Finally
		      mCapLock.Release
		    End Try
		  Loop
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
