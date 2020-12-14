#tag Window
Begin Window CapWindow
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   5.04e+2
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
   Placement       =   1
   Resizeable      =   True
   Title           =   "Capturing - Untitled.pcap"
   Visible         =   True
   Width           =   5.82e+2
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
      TabStop         =   True
      Text            =   "Source:"
      TextAlign       =   2
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   3
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   107
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
      Left            =   15
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
      Text            =   "Packets seen:"
      TextAlign       =   2
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   37
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   92
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
      Left            =   180
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Packets dropped:"
      TextAlign       =   2
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   21
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   104
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
      Left            =   116
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "rpcap://sdfsdf"
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   3
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   466
   End
   Begin Label SeenCount
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
      Left            =   116
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   0
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   37
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   66
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
      Left            =   296
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   0
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   21
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   109
   End
   Begin Listbox PacketList
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   ""
      Border          =   True
      ColumnCount     =   2
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
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   363
      HelpTag         =   ""
      Hierarchical    =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Time	Size"
      Italic          =   ""
      Left            =   7
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      RequiresSelection=   ""
      Scope           =   0
      ScrollbarHorizontal=   ""
      ScrollBarVertical=   True
      SelectionType   =   1
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
      Height          =   318
      HelpTag         =   ""
      Hilight         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   237
      LineNumbersColor=   "&c80000000"
      LineNumbersLittleEndian=   False
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      ShowOffsets     =   True
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      TextBackGroundColor=   "&cFFFFFF00"
      TextBackGroundColorAlt=   "&cFFFFFF00"
      TextSize        =   ""
      Top             =   148
      UseFocusRing    =   True
      Visible         =   True
      Width           =   328
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
      Left            =   490
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
      TabStop         =   True
      Text            =   0
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   21
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   59
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
      Left            =   371
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
      TabStop         =   True
      Text            =   "Bytes captured:"
      TextAlign       =   2
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   21
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   107
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
      Left            =   7
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Scope           =   0
      State           =   1
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   472
      Underline       =   ""
      Value           =   True
      Visible         =   True
      Width           =   100
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
      Left            =   61
      LimitText       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Password        =   ""
      ReadOnly        =   ""
      Scope           =   0
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   63
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   451
   End
   Begin Label Label5
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
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Filter:"
      TextAlign       =   2
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   64
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   50
   End
   Begin PushButton PushButton3
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Apply"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   516
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   63
      Underline       =   ""
      Visible         =   True
      Width           =   58
   End
   Begin Label CapCount
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
      Left            =   116
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   16
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   0
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   21
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   59
   End
   Begin Label Label6
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
      TabIndex        =   17
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Packets captured:"
      TextAlign       =   2
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   21
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   107
   End
   Begin ScrollBar ScrollBar1
      AcceptFocus     =   true
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   318
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   565
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Maximum         =   100
      Minimum         =   0
      PageStep        =   20
      Scope           =   0
      TabIndex        =   18
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   148
      Value           =   0
      Visible         =   True
      Width           =   16
   End
   Begin PushButton StopStartBtn
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
      Left            =   251
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Scope           =   0
      TabIndex        =   19
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   478
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin Label PendingCount
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
      Left            =   296
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   20
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   0
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   37
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   91
   End
   Begin Label Label7
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
      Left            =   174
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   21
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Packets pending:"
      TextAlign       =   2
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   37
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   110
   End
   Begin PCAP.PacketFilter PacketSrc
      Enabled         =   True
      Height          =   32
      Index           =   -2147483648
      IsRunning       =   ""
      Left            =   537
      LockedInPosition=   False
      Priority        =   ""
      Scope           =   0
      TabIndex        =   20
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   472
      Visible         =   True
      Width           =   32
   End
   Begin Label Label8
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
      Left            =   237
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   22
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Packet #:"
      TextAlign       =   2
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   103
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   75
   End
   Begin Label PacketNumber
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
      Left            =   318
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   23
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   103
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   87
   End
   Begin Label Label9
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
      Left            =   237
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   24
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Timestamp:"
      TextAlign       =   2
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   124
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   75
   End
   Begin Label Timestamp
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
      Left            =   318
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   25
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   124
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   87
   End
   Begin Label Label10
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
      Left            =   414
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   26
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Length:"
      TextAlign       =   2
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   103
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   75
   End
   Begin Label PacketLen
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
      Left            =   495
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   27
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   103
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   87
   End
   Begin Label Label11
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
      Left            =   414
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   28
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Snaplen:"
      TextAlign       =   2
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   124
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   75
   End
   Begin Label SnapLen
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
      Left            =   494
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   29
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   124
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   87
   End
   Begin Timer ScrollTimer
      Enabled         =   True
      Height          =   32
      Index           =   -2147483648
      Left            =   571
      LockedInPosition=   False
      Mode            =   0
      Period          =   100
      Scope           =   0
      TabIndex        =   29
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   148
      Visible         =   True
      Width           =   32
   End
   Begin Timer PPSTimer
      Enabled         =   True
      Height          =   32
      Index           =   -2147483648
      Left            =   631
      LockedInPosition=   False
      Mode            =   2
      Period          =   1250
      Scope           =   0
      TabIndex        =   30
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   -9
      Visible         =   True
      Width           =   32
   End
   Begin Label PacketRate
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
      Left            =   490
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   30
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   0
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   37
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   91
   End
   Begin Label Label12
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
      Left            =   386
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   31
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Packets/sec:"
      TextAlign       =   2
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   37
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   92
   End
   Begin Canvas Blinker
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AutoDeactivate  =   True
      Backdrop        =   ""
      DoubleBuffer    =   True
      Enabled         =   True
      EraseBackground =   False
      Height          =   10
      HelpTag         =   "Blinkenlight"
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   7
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   32
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   89
      UseFocusRing    =   True
      Visible         =   True
      Width           =   10
   End
   Begin Timer BlinkTimer
      Enabled         =   True
      Height          =   32
      Index           =   -2147483648
      Left            =   667
      LockedInPosition=   False
      Mode            =   0
      Period          =   100
      Scope           =   0
      TabIndex        =   34
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   -9
      Visible         =   True
      Width           =   32
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Function CancelClose(appQuitting as Boolean) As Boolean
		  #pragma Unused appQuitting
		  If PacketSrc.IsRunning Then Return MsgBox("Confirm close?", 4 + 48, "Capture in progress") <> 6
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub Close()
		  If PacketSrc <> Nil Then PacketSrc.Stop
		  If mCapture <> Nil Then mCapture.Close
		  If mDump <> Nil Then mDump.Close
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub BeginCapture(ActiveCapture As PCAP.Capture, SaveTo As FolderItem, InitialFilter As PCAP.Filter)
		  mCapture = ActiveCapture
		  mFilter = InitialFilter
		  If mFilter <> Nil Then FilterString.Text = mFilter.Expression
		  If SaveTo <> Nil Then
		    mDump = PCAP.DumpFile.Create(ActiveCapture, SaveTo)
		    Self.Title = "Capturing to '" + SaveTo.Name + "'"
		  Else
		    Self.Title = "Capturing on '" + ActiveCapture.Source.Win32Name + "'"
		  End If
		  PacketSrc.Source = ActiveCapture
		  PacketSrc.Priority = 5
		  PacketSrc.Start()
		  If ActiveCapture.Source <> Nil Then AdaptorPath.Text = ActiveCapture.Source.Name
		  BlinkTimer.Mode = Timer.ModeMultiple
		  Self.Show
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DrawGradientOval(g As Graphics, X As Integer, Y As Integer, Width As Integer, Height As Integer, StartColor As Color, EndColor As Color)
		  Dim ratio, endratio as Double
		  
		  Dim buffer, mask As Picture
		  buffer = New Picture(Width, Height, 32)
		  mask = New Picture(Width, Height, 32)
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

	#tag Method, Flags = &h21
		Private Sub DumpPackets()
		  If PacketList.SelCount <= 0 Then Return
		  Dim f As FolderItem = GetSaveFolderItem("", "packet_dump.raw")
		  If f = Nil Then Return
		  Dim pks() As PCAP.Packet
		  For i As Integer = 0 To PacketList.ListCount - 1
		    If PacketList.Selected(i) Then
		      Dim p As PCAP.Packet = PacketList.RowTag(i)
		      pks.Append(p)
		    End If
		  Next
		  
		  Dim bs As BinaryStream = BinaryStream.Create(f, True)
		  For i As Integer = 0 To UBound(pks)
		    bs.Write(pks(i).StringValue)
		  Next
		  bs.Close
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
		Sub OpenCapture(ActiveCapture As PCAP.Capture, SourceFile As FolderItem, InitialFilter As PCAP.Filter)
		  mCapture = ActiveCapture
		  #If RBVersion > 2019 Then
		    AdaptorPath.Text = SourceFile.NativePath
		  #Else
		    AdaptorPath.Text = SourceFile.AbsolutePath
		  #endif
		  mFilter = InitialFilter
		  If mFilter <> Nil Then FilterString.Text = mFilter.Expression
		  Self.Title = "Reading capture file"
		  PacketSrc.Source = mCapture
		  PacketSrc.Priority = 10
		  PacketSrc.Start
		  Self.Show
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mBlinkA As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mBlinkB As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mByteCount As UInt64
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCapture As PCAP.Capture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDump As PCAP.DumpFile
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFilter As PCAP.Filter
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLastCount As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLastTime As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPacketCount As UInt64
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mScrollLock As Boolean
	#tag EndProperty


#tag EndWindowCode

#tag Events PacketList
	#tag Event
		Sub Change()
		  If Me.ListIndex <> -1 Then
		    ScrollBar1.Value = 0
		    ScrollTimer.Mode = Timer.ModeSingle
		    Dim p As PCAP.Packet = Me.RowTag(Me.ListIndex)
		    PacketNumber.Text = Format(Me.ListIndex, "###,###,###,##0")
		    Timestamp.Text = Format(p.TimeStamp - mCapture.Epoch, "+###,###,##0.00000000")
		    SnapLen.Text = FormatBytes(p.SnapLength)
		    PacketLen.Text = FormatBytes(p.Length)
		    PacketView.StreamLen = PacketView.StreamLen + p.SnapLength
		    PacketView.ShowData(New BinaryStream(p.StringValue), p.SnapLength)
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  #pragma Unused X
		  #pragma Unused Y
		  If Me.SelCount <= 0 Then Return False
		  base.Append(New MenuItem("Dump to file..."))
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  Select Case hitItem.Text
		  Case "Dump to file..."
		    DumpPackets()
		    Return True
		  End Select
		End Function
	#tag EndEvent
	#tag Event
		Function CellClick(row as Integer, column as Integer, x as Integer, y as Integer) As Boolean
		  #pragma Unused row
		  #pragma Unused column
		  #pragma Unused x
		  #pragma Unused y
		  
		  If IsContextualClick Then Return True
		End Function
	#tag EndEvent
	#tag Event
		Function CompareRows(row1 as Integer, row2 as Integer, column as Integer, ByRef result as Integer) As Boolean
		  Dim p1, p2 As PCAP.Packet
		  p1 = Me.RowTag(row1)
		  p2 = Me.RowTag(row2)
		  
		  If column = 0  Then ' timestamps
		    Dim tm1, tm2 As Double
		    tm1 = p1.TimeStamp
		    tm2 = p2.TimeStamp
		    If tm1 > tm2 Then
		      result = 1
		      Return True
		    ElseIf tm1 < tm2 Then
		      result = -1
		      Return True
		    Else
		      Return True
		    End If
		    
		  ElseIf column = 1 Then ' sizes
		    Dim sz1, sz2 As Integer
		    sz1 = p1.Length
		    sz2 = p2.Length
		    If sz1 > sz2 Then
		      result = 1
		      Return True
		    ElseIf sz1 < sz2 Then
		      result = -1
		      Return True
		    Else
		      Return True
		    End If
		    
		  End If
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events PacketView
	#tag Event
		Function Scrolled(LinesDelta As Integer, BytesDelta As Integer) As Boolean
		  #pragma Unused BytesDelta
		  
		  ScrollBar1.Maximum = PacketView.LineCount - (PacketView.VisibleLineCount \ 2)
		  ScrollBar1.Value = ScrollBar1.Value + LinesDelta
		  
		  Return True ' Since we're updating the offset in ScrollBar1.ValueChanged, we return true to prevent the HexViewer from updating it too.
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events PushButton3
	#tag Event
		Sub Action()
		  Dim f As PCAP.Filter = PCAP.Filter.Compile(FilterString.Text, mCapture)
		  If f = Nil Then
		    MsgBox("Invalid filter. " + PCAP.Filter.LastCompileError)
		    Return
		  End If
		  Dim c As UInt64 = mCapture.PacketCount
		  
		  
		  mCapture.CurrentFilter = f
		  mFilter = f
		  If PacketList.ListCount > 0 And MsgBox("Would you like to apply this filter to the packets which have already been captured?", 4 + 32, "Update UI?") = 6 Then
		    For i As Integer = PacketList.ListCount - 1 DownTo 0
		      Dim p As PCAP.Packet = PacketList.RowTag(i)
		      If p <> f Then PacketList.RemoveRow(i)
		    Next
		  End If
		  MsgBox("Filter changed")
		  mPacketCount = mPacketCount + c
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ScrollBar1
	#tag Event
		Sub ValueChanged()
		  If mScrollLock Then Return
		  mScrollLock = True
		  PacketView.Offset = Me.Value * PacketView.BytesPerLine
		  mScrollLock = False
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events StopStartBtn
	#tag Event
		Sub Action()
		  If Me.Caption = "Start" Then
		    PacketSrc.Start()
		    Me.Caption = "Stop"
		  Else
		    PacketSrc.Stop()
		    Me.Caption = "Start"
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PacketSrc
	#tag Event
		Sub PacketArrived(NewPacket As PCAP.Packet)
		  If mDump <> Nil Then mDump.WritePacket(NewPacket)
		  If mCapture.IsLive Then
		    If mCapture.Source <> Nil Then AdaptorPath.Text = mCapture.Source.Name
		    DropCount.Text = Format(mCapture.DropCount, "###,###,###,##0")
		    SeenCount.Text = Format(mCapture.PacketCount, "###,###,###,##0")
		  End If
		  PacketList.AddRow(Format(NewPacket.TimeStamp - mCapture.Epoch, "+###,###,##0.00000000"), FormatBytes(NewPacket.SnapLength))
		  mByteCount = mByteCount + NewPacket.Length
		  mPacketCount = mPacketCount + 1
		  PacketList.RowTag(PacketList.LastIndex) = NewPacket
		  CapCount.Text = Format(mPacketCount, "###,###,###,##0")
		  If Autoscroll.Value Then PacketList.ScrollPosition = PacketList.LastIndex
		  ByteCount.Text = FormatBytes(mByteCount)
		  
		  If mBlinkB Then mBlinkA = False Else mBlinkA = True
		  If mBlinkA Then mBlinkB = True Else mBlinkB = False
		End Sub
	#tag EndEvent
	#tag Event
		Sub EOF()
		  StopStartBtn.Caption = "Start"
		  StopStartBtn.Enabled = False
		  PPSTimer.Mode = Timer.ModeOff
		  PacketRate.Text = "∞"
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ScrollTimer
	#tag Event
		Sub Action()
		  ScrollBar1.Maximum = PacketView.LineCount - (PacketView.VisibleLineCount \ 2)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PPSTimer
	#tag Event
		Sub Action()
		  Dim now As Double = Microseconds
		  Dim time As Double = (now - mLastTime) / 1000000 ' duration in seconds
		  Dim pps As Integer = mPacketCount - mLastCount \ time
		  If pps > 0 Then
		    PacketRate.Text = Format(pps, "###,###,##0")
		  Else
		    PacketRate.Text = "< 1"
		  End If
		  mLastTime = now
		  mLastCount = mPacketCount
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Blinker
	#tag Event
		Sub Paint(g As Graphics)
		  #If RBVersion >= 2012.02 Then
		    #pragma Unused areas
		  #endif
		  Dim gradstart, gradend As Color
		  If mBlinkA Then
		    gradstart = &c00FF0000
		    gradend = &c00600000
		  Else
		    gradstart = &c00600000
		    gradend = &c00200000
		  End If
		  g.AntiAlias = True
		  DrawGradientOval(g, 0, 0, g.Width, g.Height, gradstart, gradend)
		  
		  mBlinkA = False
		  mBlinkB = False
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events BlinkTimer
	#tag Event
		Sub Action()
		  If mCapture = Nil Then Return
		  Blinker.Invalidate(False)
		End Sub
	#tag EndEvent
#tag EndEvents
