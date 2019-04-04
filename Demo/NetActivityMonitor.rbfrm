#tag Window
Begin Window NetActivityMonitor
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   3
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   64
   ImplicitInstance=   True
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
   Placement       =   0
   Resizeable      =   True
   Title           =   "Activity"
   Visible         =   True
   Width           =   64
   Begin Canvas Canvas1
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AutoDeactivate  =   True
      Backdrop        =   ""
      DoubleBuffer    =   True
      Enabled         =   True
      EraseBackground =   False
      Height          =   64
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      UseFocusRing    =   True
      Visible         =   True
      Width           =   64
   End
   Begin Timer Timer1
      Height          =   32
      Index           =   -2147483648
      Left            =   380
      LockedInPosition=   False
      Mode            =   0
      Period          =   100
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   14
      Width           =   32
   End
   Begin Thread CapThread
      Height          =   32
      Index           =   -2147483648
      Left            =   380
      LockedInPosition=   False
      Priority        =   1
      Scope           =   0
      StackSize       =   0
      TabPanelIndex   =   0
      Top             =   57
      Width           =   32
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  #If TargetWin32 Then
		    App.UseGDIPlus = True
		  #endif
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub DrawGradientOval(g As Graphics, X As Integer, Y As Integer, Width As Integer, Height As Integer, StartColor As Color, EndColor As Color)
		  Dim ratio, endratio as Double
		  
		  Dim buffer, mask As Picture
		  buffer = New Picture(Width, Height)
		  mask = New Picture(Width, Height)
		  mask.Graphics.ForeColor = &cFFFFFF00
		  mask.Graphics.FillRect(0, 0, Width, Height)
		  mask.Graphics.ForeColor = &c00000000
		  mask.Graphics.FillOval(0, 0, Width, Height)
		  
		  Dim area As Graphics = buffer.Graphics
		  For i As Integer = 0 To area.Height + 1
		    ratio = ((area.Height - i) / area.Height)
		    endratio = (i / area.Height)
		    area.ForeColor = RGB(EndColor.Red * endratio + StartColor.Red * ratio, EndColor.Green * endratio + StartColor.Green * ratio, _
		    EndColor.Blue * endratio + StartColor.Blue * ratio)
		    area.DrawLine(0, i, Width, i)
		  next
		  
		  buffer.ApplyMask(mask)
		  g.DrawPicture(buffer, X, Y)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowAdaptor(Adaptor As PCAP.Adaptor)
		  Self.Title = "Activity - " + Adaptor.Name
		  mCapLock = New Semaphore
		  mCapture = PCAP.BeginCapture(Adaptor, True, PCAP.MAX_SNAP_LENGTH, 50)
		  Timer1.Mode = Timer.ModeMultiple
		  Self.Show
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		A As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		B As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCapLock As Semaphore
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCapture As PCAP.Capture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPackets() As PCAP.Packet
	#tag EndProperty


#tag EndWindowCode

#tag Events Canvas1
	#tag Event
		Sub Paint(g As Graphics)
		  Dim gradstart, gradend As Color
		  If A Then
		    gradstart = &c00FF0000
		    gradend = &c00600000
		  Else
		    gradstart = &c00600000
		    gradend = &c00200000
		  End If
		  g.AntiAlias = True
		  DrawGradientOval(g, 0, 0, g.Width, g.Height, gradstart, gradend)
		  
		  A = False
		  B = False
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Timer1
	#tag Event
		Sub Action()
		  If mCapture = Nil Then Return
		  If CapThread.State = Thread.Suspended Then
		    CapThread.Resume
		  ElseIf CapThread.State <> Thread.Running Then
		    CapThread.Run
		  End If
		  Canvas1.Invalidate(False)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CapThread
	#tag Event
		Sub Run()
		  Do
		    If mCapture.ReadNext() <> Nil Then
		      If B Then A = False Else A = True
		      If A Then B = True Else B = False
		    Else
		      App.YieldToNextThread
		    End If
		  Loop
		End Sub
	#tag EndEvent
#tag EndEvents
