#tag Window
Begin Window DemoWindow
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   1.26e+2
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
   Resizeable      =   True
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
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Begin Capture"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   260
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   57
      Underline       =   ""
      Visible         =   True
      Width           =   110
   End
   Begin CheckBox DumpCap
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Dump to File"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   479
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      State           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   59
      Underline       =   ""
      Value           =   False
      Visible         =   True
      Width           =   100
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
      Left            =   375
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      State           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   59
      Underline       =   ""
      Value           =   False
      Visible         =   True
      Width           =   100
   End
   Begin PushButton PushButton2
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Open CaptureFile"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   4
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   57
      Underline       =   ""
      Visible         =   True
      Width           =   124
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
      Left            =   74
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
      Top             =   91
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   176
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
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Initial filter:"
      TextAlign       =   2
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   92
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   70
   End
   Begin PushButton PushButton3
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Check"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   260
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
      Top             =   91
      Underline       =   ""
      Visible         =   True
      Width           =   81
   End
   Begin PushButton PushButton4
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Live Wire!"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   140
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   57
      Underline       =   ""
      Visible         =   True
      Width           =   110
   End
   Begin PushButton PushButton5
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
      Left            =   469
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   92
      Underline       =   ""
      Visible         =   True
      Width           =   110
   End
End
#tag EndWindow

#tag WindowCode
#tag EndWindowCode

#tag Events Adaptors
	#tag Event
		Sub Open()
		  Dim c As Integer = PCAP.CaptureDeviceCount
		  For i As Integer = 0 To c - 1
		    Dim a As PCAP.Adaptor = PCAP.GetCaptureDevice(i)
		    Me.AddRow(a.Description + "(" + a.Name + ")")
		    Me.RowTag(i) = a
		  Next
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton1
	#tag Event
		Sub Action()
		  If Adaptors.ListIndex = -1 Then
		    MsgBox("Please choose an adaptor to capture from")
		    Return
		  End If
		  Dim a As PCAP.Adaptor = Adaptors.RowTag(Adaptors.ListIndex)
		  Dim f As FolderItem
		  If DumpCap.Value Then
		    f = GetSaveFolderItem(FileTypes1.PacketCaptureFile, "Untitled.pcap")
		    If f = Nil Then Return
		  End If
		  Dim capture As PCAP.Capture = PCAP.BeginCapture(a, Promiscuous.Value, 65536, 50)
		  If capture <> Nil Then
		    Dim filter As PCAP.Filter = PCAP.Filter.Compile(FilterString.Text, capture)
		    If filter <> Nil Then capture.CurrentFilter = filter
		    Dim capwin As New CapWindow
		    capwin.BeginCapture(capture, f, filter)
		  End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton2
	#tag Event
		Sub Action()
		  Dim f As FolderItem = GetOpenFolderItem(FileTypes1.PacketCaptureFile)
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
#tag Events PushButton3
	#tag Event
		Sub Action()
		  Dim f As PCAP.Filter = PCAP.Filter.Compile(FilterString.Text)
		  If f = Nil Then
		    MsgBox("Invalid filter. " + PCAP.Filter.LastCompileError)
		  Else
		    MsgBox("Filter is OK")
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton4
	#tag Event
		Sub Action()
		  If Adaptors.ListIndex = -1 Then
		    MsgBox("Please choose an adaptor to capture from")
		    Return
		  End If
		  Dim a As PCAP.Adaptor = Adaptors.RowTag(Adaptors.ListIndex)
		  Dim livewr As New LiveWire
		  livewr.ShowAdaptor(a)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton5
	#tag Event
		Sub Action()
		  If Adaptors.ListIndex = -1 Then
		    MsgBox("Please choose an adaptor to capture from")
		    Return
		  End If
		  Dim a As PCAP.Adaptor = Adaptors.RowTag(Adaptors.ListIndex)
		  Dim mon As New NetActivityMonitor
		  mon.ShowAdaptor(a)
		End Sub
	#tag EndEvent
#tag EndEvents
