#tag Window
Begin Window DemoWindow
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   1.02e+2
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
   Placement       =   2
   Resizeable      =   False
   Title           =   "PCAP"
   Visible         =   True
   Width           =   6.0e+2
   Begin ComboBox Adaptors
      AutoComplete    =   False
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialValue    =   ""
      Italic          =   ""
      Left            =   82
      ListIndex       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   14
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   511
   End
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
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Device:"
      TextAlign       =   2
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   14
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   77
   End
   Begin PushButton BeginCaptureBtn
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Begin capture"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   342
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   74
      Underline       =   ""
      Visible         =   True
      Width           =   110
   End
   Begin CheckBox Promiscuous
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Promiscuous"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   480
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Scope           =   0
      State           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   75
      Underline       =   ""
      Value           =   False
      Visible         =   True
      Width           =   100
   End
   Begin PushButton OpenFileBtn
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Open file"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   230
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   74
      Underline       =   ""
      Visible         =   True
      Width           =   110
   End
   Begin TextField FilterString
      AcceptTabs      =   ""
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &hFFFFFF
      Bold            =   ""
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   ""
      Left            =   82
      LimitText       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Mask            =   ""
      Password        =   ""
      ReadOnly        =   ""
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   39
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   458
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
      Left            =   7
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Initial filter:"
      TextAlign       =   2
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   40
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   70
   End
   Begin PushButton CheckFilterBtn
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Check"
      Default         =   ""
      Enabled         =   False
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   542
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   39
      Underline       =   ""
      Visible         =   True
      Width           =   51
   End
   Begin PushButton LiveWireBtn
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Live wire!"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   118
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Scope           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   74
      Underline       =   ""
      Visible         =   True
      Width           =   110
   End
   Begin PushButton ActivityMonitoryBtn
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Activity monitor"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   6
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Scope           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   74
      Underline       =   ""
      Visible         =   True
      Width           =   110
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  If Not PCAP.IsAvailable Then
		    Call MsgBox("PCAP library is not installed! This application will now exit.", 48, "Missing dependency")
		    Quit
		  End If
		  If PCAP.IsNpcap Then
		    Self.Title = "RB-PCAP (" + PCAP.Version + " Npcap)"
		  Else
		    Self.Title = "RB-PCAP (" + PCAP.Version + ")"
		  End If
		  #If Not TargetWin32 Then
		    Dim sh As New Shell
		    sh.Mode = 0
		    sh.Execute("whoami")
		    If sh.ReadAll.Trim <> "root" Then
		      Call MsgBox("Capturing from a network adaptor might be unavailable unless running as root", 48, "root needed")
		    End If
		  #endif
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Shared Function GUnZip(CaptureFile As FolderItem) As FolderItem
		  #If TargetWin32 Then
		    Const zlib1 = "zlib1.dll"
		  #ElseIf TargetLinux Then
		    Const zlib1 = "libz.so.1"
		  #Else
		    Const zlib1 = "/usr/lib/libz.dylib"
		  #endif
		  
		  If Not System.IsFunctionAvailable("gzopen", zlib1) Then
		    Return CaptureFile
		  Else
		    Dim bs As BinaryStream = BinaryStream.Open(CaptureFile)
		    Dim isgz As Boolean = (bs.ReadUInt8 = &h1F And bs.ReadUInt8 = &h8B)
		    bs.Close
		    If Not isgz Then Return CaptureFile
		  End If
		  
		  Soft Declare Function gzopen Lib zlib1 (Path As CString, Mode As CString) As Ptr
		  Soft Declare Function gzclose Lib zlib1 (gzFile As Ptr) As Integer
		  Soft Declare Function gzread Lib zlib1 (gzFile As Ptr, Buffer As Ptr, Length As UInt32) As Integer
		  Soft Declare Function gzeof Lib zlib1 (gzFile As Ptr) As Boolean
		  
		  #If RBVersion > 2019 Then
		    Dim strm As Ptr = gzOpen(CaptureFile.NativePath, "rb")
		  #Else
		    Dim strm As Ptr = gzOpen(CaptureFile.AbsolutePath, "rb")
		  #endif
		  If strm = Nil Then Return Nil
		  Dim tmp As FolderItem = GetTemporaryFolderItem()
		  Dim bs As BinaryStream = BinaryStream.Open(tmp, True)
		  Do Until gzeof(strm)
		    Dim mb As New MemoryBlock(16384)
		    Dim red As Integer = gzread(strm, mb, mb.Size)
		    If red > 0 Then
		      mb.Size = red
		      bs.Write(mb)
		    End If
		  Loop
		  bs.Close
		  Call gzclose(strm)
		  Return tmp
		End Function
	#tag EndMethod


#tag EndWindowCode

#tag Events Adaptors
	#tag Event
		Sub Open()
		  Dim c As Integer = PCAP.CaptureDeviceCount
		  For i As Integer = 0 To c - 1
		    Dim a As PCAP.Adaptor = PCAP.GetCaptureDevice(i)
		    Dim txt As String = a.Win32Name
		    If a.Description <> "" Then txt = txt + " (" + a.Description + ")"
		    Me.AddRow(txt)
		    Me.RowTag(i) = a
		  Next
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events BeginCaptureBtn
	#tag Event
		Sub Action()
		  If Adaptors.ListIndex = -1 Then
		    MsgBox("Please select a capture device.")
		    Return
		  End If
		  Dim a As PCAP.Adaptor = Adaptors.RowTag(Adaptors.ListIndex)
		  
		  Dim f As FolderItem
		  Select Case MsgBox("Dump packets to a file?", 3 + 32, "File creation")
		  Case 6 ' yes
		    f = GetSaveFolderItem(FileTypes1.PacketCaptureFile, "Untitled.pcap")
		    If f = Nil Then Return
		  Case 2 ' cancel
		    Return
		  End Select
		  
		  Dim capture As PCAP.Capture = PCAP.BeginCapture(a, Promiscuous.Value, 65536, -1)
		  If capture <> Nil Then
		    Dim filter As PCAP.Filter = PCAP.Filter.Compile(FilterString.Text, capture)
		    If filter <> Nil Then capture.CurrentFilter = filter
		    Dim capwin As New CapWindow
		    capwin.BeginCapture(capture, f, filter)
		  End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events OpenFileBtn
	#tag Event
		Sub Action()
		  Dim f As FolderItem
		  #If TargetWin32 Then
		    Const zlib1 = "zlib1.dll"
		  #ElseIf TargetLinux Then
		    Const zlib1 = "libz.so.1"
		  #Else
		    Const zlib1 = "/usr/lib/libz.dylib"
		  #endif
		  If System.IsFunctionAvailable("gzopen", zlib1) Then
		    f = GetOpenFolderItem(FileTypes1.PacketCaptureFileAll)
		    If f <> Nil Then f = GUnZip(f)
		  Else
		    f = GetOpenFolderItem(FileTypes1.PacketCaptureFile)
		  End If
		  
		  If f <> Nil And f.Exists Then
		    Dim cap As PCAP.Capture = PCAP.OpenCapture(f)
		    If cap <> Nil Then
		      Dim filter As PCAP.Filter = PCAP.Filter.Compile(FilterString.Text, cap)
		      If filter <> Nil Then cap.CurrentFilter = filter
		      Dim capwin As New CapWindow
		      capwin.OpenCapture(cap, f, filter)
		    End If
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events FilterString
	#tag Event
		Sub TextChange()
		  CheckFilterBtn.Enabled = (Me.Text.Trim <> "")
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CheckFilterBtn
	#tag Event
		Sub Action()
		  If Not PCAP.IsValidFilter(FilterString.Text) Then
		    MsgBox("Invalid filter. " + PCAP.Filter.LastCompileError)
		  Else
		    MsgBox("Filter is OK")
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LiveWireBtn
	#tag Event
		Sub Action()
		  If Adaptors.ListIndex = -1 Then
		    MsgBox("Please select a capture device.")
		    Return
		  End If
		  Dim a As PCAP.Adaptor = Adaptors.RowTag(Adaptors.ListIndex)
		  Dim livewr As New LiveWire
		  livewr.ShowAdaptor(a, FilterString.Text)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ActivityMonitoryBtn
	#tag Event
		Sub Action()
		  If Adaptors.ListIndex = -1 Then
		    MsgBox("Please select a capture device.")
		    Return
		  End If
		  Dim a As PCAP.Adaptor = Adaptors.RowTag(Adaptors.ListIndex)
		  Dim mon As New NetActivityMonitor
		  mon.ShowAdaptor(a)
		End Sub
	#tag EndEvent
#tag EndEvents
