#tag Module
Protected Module PCAP
	#tag Method, Flags = &h1
		Protected Function BeginCapture(CaptureDevice As PCAP.Adaptor, PromiscuousMode As Boolean = False, SnapLength As Integer = PCAP.MAX_SNAP_LENGTH, TimeOut As Integer = 1000, BufferSize As Integer = -1) As PCAP.Capture
		  ' Begins a capture operation on the specified device and returns it as a Capture object.
		  ' SnapLength is the maximum number of bytes to capture from each packet. Timeout is the interval to
		  ' wait for new packets when calling Capture.ReadNext. For GUI applications you should use a low
		  ' timeout (e.g. 50ms instead of the default 1000ms) to maintain responsiveness. You may also
		  ' specify a timeout of -1 for non-blocking operation.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-PCAP/wiki/PCAP.BeginCapture
		  
		  Dim flags As Integer
		  If PromiscuousMode Then flags = PCAP_OPENFLAG_PROMISCUOUS
		  Dim ret As Capture
		  If TimeOut = -1 Then
		    ret = PCAP.Capture.Create(CaptureDevice, SnapLength, 1000, flags, BufferSize)
		    ret.Blocking = False
		  Else
		    ret = PCAP.Capture.Create(CaptureDevice, SnapLength, TimeOut, flags, BufferSize)
		  End If
		  Return ret
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CaptureDeviceCount() As Integer
		  ' Returns the number of local devices that are available for packet capture.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-PCAP/wiki/PCAP.CaptureDeviceCount
		  
		  Return PCAP.Adaptor.GetAdaptorCount()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetCaptureDevice(Index As Integer) As PCAP.Adaptor
		  ' Returns the capture device at Index. The last device is at CaptureDeviceCount-1
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-PCAP/wiki/PCAP.GetCaptureDevice
		  
		  Return PCAP.Adaptor.GetAdaptor(Index)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetLinkType(Type As String) As PCAP.LinkType
		  If Not PCAP.IsAvailable Then Raise New PlatformNotSupportedException
		  Return LinkType(pcap_datalink_name_to_val(Type))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function IsAvailable() As Boolean
		  ' Returns True if libpcap/WinPcap is available at runtime.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-PCAP/wiki/PCAP.IsAvailable
		  
		  Static available As Boolean
		  If Not available Then available = System.IsFunctionAvailable("pcap_close", libpcap)
		  Return available
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsPCAPFile(Extends CaptureFile As FolderItem) As Boolean
		  ' Returns True if the file is likely a PCAP file.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-PCAP/wiki/PCAP.IsPCAPFile
		  
		  If CaptureFile = Nil Or CaptureFile.Directory Then Return False
		  Dim bs As BinaryStream
		  Dim magic As Integer
		  Try
		    bs = BinaryStream.Open(CaptureFile)
		    magic = bs.ReadInt32
		  Catch
		    magic = 0
		  Finally
		    If bs <> Nil Then bs.Close
		  End Try
		  Return (magic = &ha1b2c3d4 Or magic = &hd4c3b2a1)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function IsValidFilter(Expression As String, Optional ActiveCapture As PCAP.Capture) As Boolean
		  ' Returns True is the Expression is a valid bpf program. If this method returns
		  ' False then you may read the compiler error message in PCAP.Filter.LastCompileError
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-PCAP/wiki/PCAP.IsValidFilter
		  
		  If PCAP.IsAvailable Then Return Filter.Compile(Expression, ActiveCapture) <> Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function LinkTypeDescription(Type As PCAP.LinkType) As String
		  If Not PCAP.IsAvailable Then Raise New PlatformNotSupportedException
		  Dim mb As MemoryBlock = pcap_datalink_val_to_description(Type)
		  If mb <> Nil Then Return mb.CString(0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function LinkTypeName(Type As PCAP.LinkType) As String
		  If Not PCAP.IsAvailable Then Raise New PlatformNotSupportedException
		  Dim mb As MemoryBlock = pcap_datalink_val_to_name(Type)
		  If mb <> Nil Then Return mb.CString(0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function OpenCapture(CaptureFile As FolderItem, SnapLength As Integer = PCAP.MAX_SNAP_LENGTH, Flags As UInt32 = 0) As PCAP.Capture
		  ' Opens a capture file and returns it as a Capture object. SnapLength is the maximum number of bytes
		  ' to read from each captured packet. Flags is a bitmask of capture flags.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-PCAP/wiki/PCAP.OpenCapture
		  
		  Return PCAP.Capture.Open(CaptureFile, SnapLength, Flags)
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub pcap_close Lib libpcap (pcap_t As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function pcap_compile Lib libpcap (pcap_t As Ptr, BPFProgram As Ptr, FilterString As CString, Optimize As Integer, NetMask As UInt32) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function pcap_compile_nopcap Lib libpcap (SnapLength As Integer, LinkType As Integer, BPFProgram As Ptr, FilterString As CString, Optimize As Integer, NetMask As UInt32) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function pcap_datalink Lib libpcap (pcap_t As Ptr) As PCAP.LinkType
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function pcap_datalink_name_to_val Lib libpcap (LinkName As CString) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function pcap_datalink_val_to_description Lib libpcap (Type As LinkType) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function pcap_datalink_val_to_name Lib libpcap (Type As LinkType) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub pcap_dump Lib libpcap (pcap_dumper_t As Ptr, ByRef Header As pcap_pkthdr, RawData As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub pcap_dump_close Lib libpcap (pcap_dumper_t As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function pcap_dump_file Lib libpcap (pcap_dumper_t As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function pcap_dump_flush Lib libpcap (pcap_dumper_t As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function pcap_dump_ftell Lib libpcap (pcap_dumper_t As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function pcap_dump_open Lib libpcap (pcap_t As Ptr, FileName As CString) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function pcap_findalldevs Lib libpcap (ByRef alldevs As Ptr, errbuff As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function pcap_findalldevs_ex Lib libpcap (source As CString, auth As Ptr, ByRef alldevs As Ptr, errbuff As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub pcap_freealldevs Lib libpcap (alldevs As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub pcap_freecode Lib libpcap (FilterProgram As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function pcap_geterr Lib libpcap (pcap_t As Ptr) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function pcap_getnonblock Lib libpcap (pcap_t As Ptr, ErrorBuffer As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function pcap_is_swapped Lib libpcap (pcap_t As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function pcap_lib_version Lib libpcap () As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function pcap_lookupnet Lib libpcap (Source As CString, ByRef Subnet As UInt32, ByRef NetMask As UInt32, ErrorBuffer As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function pcap_major_version Lib libpcap (pcap_t As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function pcap_minor_version Lib libpcap (pcap_t As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function pcap_next_ex Lib libpcap (pcap_t As Ptr, ByRef pckhdr As Ptr, ByRef pkt_data As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function pcap_offline_filter Lib libpcap (BPFProgram As Ptr, ByRef Header As pcap_pkthdr, Data As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function pcap_open Lib libpcap (source As CString, snaplen As Integer, Flags As Integer, ReadTimeout As Integer, auth As Ptr, errbuff As Ptr) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function pcap_open_dead Lib libpcap (LinkType As PCAP . LinkType, SnapLength As Integer) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function pcap_open_live Lib libpcap (Device As CString, snaplen As Integer, Flags As Integer, ReadTimeout As Integer, errbuff As Ptr) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function pcap_open_offline Lib libpcap (CaptureFile As CString, errbuff As Ptr) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function pcap_sendpacket Lib libpcap (Adaptor As pcap_if, PacketBuffer As Ptr, BufferSize As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function pcap_sendqueue_alloc Lib libpcap (MemSize As UInt32) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub pcap_sendqueue_destroy Lib libpcap (Queue As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function pcap_sendqueue_queue Lib libpcap (Queue As Ptr, Header As pcap_pkthdr, Data As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function pcap_sendqueue_transmit Lib libpcap (Adaptor As pcap_if, Queue As Ptr, Synchronize As Integer) As UInt32
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function pcap_setbuff Lib libpcap (pcap_t As Ptr, BufferSize As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function pcap_setfilter Lib libpcap (pcap_t As Ptr, FilterProgram As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function pcap_setmintocopy Lib libpcap (pcap_t As Ptr, Size As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function pcap_setnonblock Lib libpcap (pcap_t As Ptr, Nonblock As Integer, ErrorBuffer As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function pcap_set_buffer_size Lib libpcap (pcap_t As Ptr, BufferSize As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function pcap_set_datalink Lib libpcap (pcap_t As Ptr, NewValue As PCAP . LinkType) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function pcap_snapshot Lib libpcap (pcap_t As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function pcap_stats Lib libpcap (pcap_t As Ptr, ByRef Stats As pcap_stat) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function pcap_stats_ex Lib libpcap (pcap_t As Ptr, ByRef StatSize As Integer) As Ptr
	#tag EndExternalMethod

	#tag Method, Flags = &h1
		Protected Function Version() As String
		  If Not PCAP.IsAvailable Then Return ""
		  Dim mb As MemoryBlock = pcap_lib_version()
		  If mb <> Nil Then Return mb.CString(0)
		End Function
	#tag EndMethod


	#tag Constant, Name = libpcap, Type = String, Dynamic = False, Default = \"libpcap", Scope = Private
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"wpcap"
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"libpcap.A.dylib"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"libpcap"
	#tag EndConstant

	#tag Constant, Name = MAX_SNAP_LENGTH, Type = Double, Dynamic = False, Default = \"65536", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = MODE_CAPT, Type = Double, Dynamic = False, Default = \"0", Scope = Private
	#tag EndConstant

	#tag Constant, Name = MODE_STAT, Type = Double, Dynamic = False, Default = \"1", Scope = Private
	#tag EndConstant

	#tag Constant, Name = PCAP_ERRBUF_SIZE, Type = Double, Dynamic = False, Default = \"256", Scope = Private
	#tag EndConstant

	#tag Constant, Name = PCAP_IF_LOOPBACK, Type = Double, Dynamic = False, Default = \"&h00000001", Scope = Private
	#tag EndConstant

	#tag Constant, Name = PCAP_OPENFLAG_DATATX_UDP, Type = Double, Dynamic = False, Default = \"2", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = PCAP_OPENFLAG_MAX_RESPONSIVENESS, Type = Double, Dynamic = False, Default = \"16", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = PCAP_OPENFLAG_NOCAPTURE_LOCAL, Type = Double, Dynamic = False, Default = \"8", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = PCAP_OPENFLAG_NOCAPTURE_RPCAP, Type = Double, Dynamic = False, Default = \"4", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = PCAP_OPENFLAG_PROMISCUOUS, Type = Double, Dynamic = False, Default = \"1", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = PCAP_SRC_FILE_STRING, Type = String, Dynamic = False, Default = \"file://", Scope = Private
	#tag EndConstant

	#tag Constant, Name = PCAP_SRC_IF_STRING, Type = String, Dynamic = False, Default = \"rpcap://", Scope = Private
	#tag EndConstant


	#tag Structure, Name = pcap_addr, Flags = &h21
		next_item As Ptr
		  addr As Ptr
		  netmask As Ptr
		  broadadr As Ptr
		dstaddr As Ptr
	#tag EndStructure

	#tag Structure, Name = pcap_if, Flags = &h21
		next_if As Ptr
		  name As Ptr
		  description As Ptr
		  addresses As Ptr
		flags As UInt32
	#tag EndStructure

	#tag Structure, Name = pcap_pkthdr, Flags = &h21
		ts As timeval
		  caplen As UInt32
		len As UInt32
	#tag EndStructure

	#tag Structure, Name = pcap_stat, Flags = &h21
		ps_recv As UInt16
		  ps_drop As UInt16
		  psif_drop As UInt16
		bs_capt As UInt16
	#tag EndStructure

	#tag Structure, Name = sockaddr, Flags = &h21
		sa_family As UInt16
		sa_data As CString*14
	#tag EndStructure

	#tag Structure, Name = timeval, Flags = &h21
		tv_sec As Integer
		tv_usec As Integer
	#tag EndStructure


	#tag Enum, Name = LinkType, Type = Integer, Flags = &h1
		NULL=0
		  ETHERNET=1
		  AX25=3
		  IEEE_805_5=6
		  ARCNET_BSD=7
		  SLIP=8
		  PPP=9
		  FDDI=10
		  PPP_HDLC=50
		  PPP_ETHER=51
		  ATM_RFC1483=100
		  RAW=101
		  C_HDLC=104
		  IEEE_802_11=105
		  FRELAY=107
		  LOOPBACK=108
		  LINUX_SLL=113
		  LTALK=114
		  PFLOG=117
		  IEEE802_11_PRISM=119
		  IP_OVER_FC=122
		  SUNATM=123
		  IEEE_802_11_RADIOTAP=127
		ARCNET_LINUX=129
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
