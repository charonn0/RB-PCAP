#tag Class
Protected Class Adaptor
	#tag Method, Flags = &h1
		Protected Function Address() As pcap_addr
		  Dim p As pcap_addr
		  Dim mb As MemoryBlock = iface.addresses
		  p.StringValue(TargetLittleEndian) = mb.StringValue(0, pcap_addr.Size)
		  Return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Constructor(iface As pcap_if, IfaceIndex As Integer)
		  Me.iface = iface
		  mIndex = IfaceIndex
		  refcount = refcount + 1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Description() As String
		  Dim p As MemoryBlock = iface.description
		  Return p.CString(0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Destructor()
		  refcount = refcount - 1
		  If ref <> Nil And refcount <= 0 Then
		    pcap_freealldevs(ref)
		    ref = Nil
		    refcount = 0
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function GetFirstAdaptor() As PCAP.Adaptor
		  Dim iface As pcap_if
		  ref = New MemoryBlock(4)
		  PCAP.mLastErrorMessage = New MemoryBlock(PCAP_ERRBUF_SIZE)
		  If pcap_findalldevs_ex(PCAP_SRC_IF_STRING, Nil, ref, PCAP.mLastErrorMessage) = 0 Then
		    ref = ref.Ptr(0)
		    Dim mb As MemoryBlock = ref
		    iface.StringValue(TargetLittleEndian) = mb.StringValue(0, iface.Size)
		    Return New PCAP.Adaptor(iface, 0)
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Index() As Integer
		  Return mIndex
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastErrorMessage() As String
		  If mLastErrorMessage <> Nil Then Return mLastErrorMessage.CString(0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Loopback() As Boolean
		  Return BitAnd(iface.flags, PCAP_IF_LOOPBACK) = PCAP_IF_LOOPBACK
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Name() As String
		  Dim p As MemoryBlock = iface.name
		  Return p.CString(0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NextAdaptor() As PCAP.Adaptor
		  If iface.next_if = Nil Then Return Nil
		  Dim i As pcap_if
		  Dim p As MemoryBlock = iface.next_if
		  i.StringValue(TargetLittleEndian) = p.StringValue(0, pcap_if.Size)
		  Return New PCAP.Adaptor(i, mIndex + 1)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Open(SnapLen As Integer, Flags As Integer, Timeout As Integer) As PCAP.Capture
		  mLastErrorMessage = New MemoryBlock(PCAP_ERRBUF_SIZE)
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected iface As pcap_if
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mIndex As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mLastErrorMessage As MemoryBlock
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared ref As Ptr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared refcount As Integer
	#tag EndProperty


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
End Class
#tag EndClass
