#tag Module
Protected Module PCAP
	#tag Method, Flags = &h1
		Protected Function LastErrorMessage() As String
		  Return mLastErrorMessage.CString(0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function OpenCaptureFile(CaptureFile As FolderItem, SnapLen As Integer, Flags As Integer) As PCAP.Capture
		  Dim p As Ptr
		  mLastErrorMessage = New MemoryBlock(PCAP_ERRBUF_SIZE)
		  p = pcap_open(PCAP_SRC_FILE_STRING + CaptureFile.AbsolutePath, SnapLen, Flags, -1, Nil, mLastErrorMessage)
		  If p <> Nil Then
		    Return New PCAP.Capture(p)
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function OpenNetworkInterface(CaptureInterface As NetworkInterface, SnapLen As Integer, Flags As Integer, Timeout As Integer) As PCAP.Capture
		  
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub pcap_breakloop Lib "wpcap" (pcap_t As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub pcap_close Lib "wpcap" (pcap_t As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function pcap_dispatch Lib "wpcap" (pcap_t As Ptr, Count As Integer, pcap_handler As Ptr, u_char As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function pcap_findalldevs_ex Lib "wpcap" (source As CString, auth As Ptr, alldevs As Ptr, errbuff As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub pcap_freealldevs Lib "wpcap" (alldevs As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function pcap_loop Lib "wpcap" (pcap_t As Ptr, Count As Integer, pcap_handler As Ptr, u_char As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function pcap_next Lib "wpcap" (pcap_t As Ptr, pcap_handler As Ptr) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function pcap_open Lib "wpcap" (source As CString, snaplen As Integer, Flags As Integer, ReadTimeout As Integer, auth As Ptr, errbuff As Ptr) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function pcap_stats Lib "wpcap" (pcap_t As Ptr, pcapstats As Ptr) As Integer
	#tag EndExternalMethod


	#tag Property, Flags = &h21
		Private mLastErrorMessage As MemoryBlock
	#tag EndProperty


	#tag Constant, Name = MODE_CAPT, Type = Double, Dynamic = False, Default = \"0", Scope = Private
	#tag EndConstant

	#tag Constant, Name = MODE_STAT, Type = Double, Dynamic = False, Default = \"1", Scope = Private
	#tag EndConstant

	#tag Constant, Name = PCAP_ERRBUF_SIZE, Type = Double, Dynamic = False, Default = \"256", Scope = Private
	#tag EndConstant

	#tag Constant, Name = PCAP_IF_LOOPBACK, Type = Double, Dynamic = False, Default = \"&h00000001", Scope = Private
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
