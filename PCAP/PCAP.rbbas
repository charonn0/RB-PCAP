#tag Module
Protected Module PCAP
	#tag Method, Flags = &h1
		Protected Function CaptureDeviceCount() As Integer
		  Return PCAP.Adaptor.GetAdaptorCount()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetCaptureDevice(Index As Integer) As PCAP.Adaptor
		  Return PCAP.Adaptor.GetAdaptor(Index)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function IsAvailable() As Boolean
		  Static available As Boolean
		  If Not available Then available = System.IsFunctionAvailable("pcap_open", "wpcap")
		  Return available
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function IsValidFilter(Expression As String) As Boolean
		  If PCAP.IsAvailable And CaptureDeviceCount > 0 Then
		    'Dim cap As Capture = Capture.Create(GetCaptureDevice(0))
		    Return Filter.Validate(Expression) <> Nil
		  End If
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub pcap_breakloop Lib "wpcap" (pcap_t As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub pcap_close Lib "wpcap" (pcap_t As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function pcap_compile Lib "wpcap" (pcap_t As Ptr, ByRef BPFProgram As Ptr, FilterString As CString, Optimize As Integer, NetMask As UInt32) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function pcap_compile_nopcap Lib "wpcap" (SnapLength As Integer, LinkType As Integer, ByRef BPFProgram As Ptr, FilterString As CString, Optimize As Integer, NetMask As UInt32) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function pcap_dispatch Lib "wpcap" (pcap_t As Ptr, Count As Integer, pcap_handler As Ptr, u_char As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub pcap_dump Lib "wpcap" (pcap_dumper_t As Ptr, ByRef Header As pcap_pkthdr, RawData As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub pcap_dump_close Lib "wpcap" (pcap_dumper_t As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function pcap_dump_flush Lib "wpcap" (pcap_dumper_t As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function pcap_dump_ftell Lib "wpcap" (pcap_dumper_t As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function pcap_dump_open Lib "wpcap" (pcap_t As Ptr, FileName As CString) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function pcap_findalldevs_ex Lib "wpcap" (source As CString, auth As Ptr, ByRef alldevs As Ptr, errbuff As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub pcap_freealldevs Lib "wpcap" (alldevs As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub pcap_freecode Lib "wpcap" (FilterProgram As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function pcap_loop Lib "wpcap" (pcap_t As Ptr, Count As Integer, pcap_handler As Ptr, u_char As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function pcap_next Lib "wpcap" (pcap_t As Ptr, pcap_handler As Ptr) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function pcap_next_ex Lib "wpcap" (pcap_t As Ptr, ByRef pckhdr As Ptr, ByRef pkt_data As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function pcap_open Lib "wpcap" (source As CString, snaplen As Integer, Flags As Integer, ReadTimeout As Integer, auth As Ptr, errbuff As Ptr) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function pcap_open_dead Lib "wpcap" (LinkType As PCAP . LinkType, SnapLength As Integer) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function pcap_sendpacket Lib "wpcap" (Adaptor As pcap_if, PacketBuffer As Ptr, BufferSize As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function pcap_setfilter Lib "wpcap" (pcap_t As Ptr, FilterProgram As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function pcap_stats Lib "wpcap" (pcap_t As Ptr, pcapstats As Ptr) As Integer
	#tag EndExternalMethod


	#tag Constant, Name = MODE_CAPT, Type = Double, Dynamic = False, Default = \"0", Scope = Private
	#tag EndConstant

	#tag Constant, Name = MODE_STAT, Type = Double, Dynamic = False, Default = \"1", Scope = Private
	#tag EndConstant

	#tag Constant, Name = OPENFLAG_PROMISCUOUS, Type = Double, Dynamic = False, Default = \"1", Scope = Protected
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
