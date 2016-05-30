#tag Class
Protected Class Adaptor
	#tag Method, Flags = &h1
		Protected Function Address() As pcap_addr
		  Dim p As pcap_addr = iface.addresses.pcap_addr
		  Return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(iface As pcap_if, IfaceIndex As Integer)
		  If Not PCAP.IsAvailable Then Raise New PlatformNotSupportedException
		  Me.iface = iface
		  mIndex = IfaceIndex
		  refcount = refcount + 1
		  Dim p As MemoryBlock = Me.iface.name
		  mName = p.CString(0)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  refcount = refcount - 1
		  If ref <> Nil And refcount <= 0 Then
		    pcap_freealldevs(ref)
		    ref = Nil
		    refcount = 0
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function GetAdaptor(Index As Integer) As PCAP.Adaptor
		  ' Returns the Adaptor at Index. The last Adaptor is at Index=GetAdaptorCount-1
		  
		  If Not PCAP.IsAvailable Then Return Nil
		  
		  Dim errmsg As New MemoryBlock(PCAP_ERRBUF_SIZE)
		  If ref = Nil Then
		    #If TargetWin32 Then
		      If pcap_findalldevs_ex(PCAP_SRC_IF_STRING, Nil, ref, errmsg) <> 0 Then Raise New PCAPException(errmsg)
		    #Else
		      If pcap_findalldevs(ref, errmsg) <> 0 Then Raise New PCAPException(errmsg)
		    #endif
		  End If
		  
		  Dim ret As PCAP.Adaptor
		  Dim count As Integer
		  Dim lst As Ptr = ref
		  Do Until ret <> Nil
		    If lst = Nil Then Raise New OutOfBoundsException
		    Dim iface As pcap_if = lst.pcap_if
		    If count = Index Then 
		      ret = New PCAP.Adaptor(iface, count)
		      Exit Do
		    End If
		    lst = iface.next_if
		    count = count + 1
		  Loop Until count > Index
		  Return ret
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function GetAdaptorCount() As Integer
		  ' Returns the number of Adaptors available.
		  
		  If Not PCAP.IsAvailable Then Return -1
		  
		  If ref = Nil Then
		    Dim errmsg As New MemoryBlock(PCAP_ERRBUF_SIZE)
		    #If TargetWin32 Then
		      If pcap_findalldevs_ex(PCAP_SRC_IF_STRING, Nil, ref, errmsg) <> 0 Then Return 0
		    #Else
		      If pcap_findalldevs(ref, errmsg) <> 0 Then Return 0
		    #endif
		  End If
		  Dim count As Integer
		  Dim lst As Ptr = ref
		  Do
		    If lst = Nil Then Exit Do
		    lst = lst.Ptr(0)
		    count = count + 1
		  Loop
		  Return Count
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SendPacket(RawPackets() As PCAP.Packet, Synchronize As Boolean = False) As Boolean
		  ' Writes an array of packets to the adaptor. If Synchronize is True then the Packets' original timestamps are respected.
		  
		  Dim sz As UInt32
		  For Each p As Packet In RawPackets
		    sz = sz + p.SnapLength
		  Next
		  Dim queue As Ptr = pcap_sendqueue_alloc(sz)
		  If queue = Nil Then Raise New OutOfMemoryException
		  Dim ret As Boolean
		  Try
		    For i As Integer = 0 To UBound(RawPackets)
		      If pcap_sendqueue_queue(queue, RawPackets(i).Header, RawPackets(i)) <> 0 Then Raise New PCAPException("Unable to queue the packet!")
		    Next
		    Dim sync As Integer
		    If Synchronize Then sync = 1
		    ret = (sz = pcap_sendqueue_transmit(iface, queue, sync))
		  Finally
		    pcap_sendqueue_destroy(queue)
		  End Try
		  Return ret
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SendPacket(RawPacket As PCAP.Packet) As Boolean
		  ' Writes a packet to the adaptor. 
		  
		  Dim data As MemoryBlock = RawPacket.StringValue
		  Return pcap_sendpacket(iface, data, data.Size) = 0
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  ' Returns a human-readable description of the device
			  Dim p As MemoryBlock = iface.description
			  If p <> Nil Then Return p.CString(0)
			End Get
		#tag EndGetter
		Description As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  ' Returns the flags that were used when opening the device.
			  
			  Return iface.flags
			End Get
		#tag EndGetter
		Flags As UInt32
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected iface As pcap_if
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  ' The index of the device, i.e. the index parameter to GetCaptureDevice
			  
			  Return mIndex
			End Get
		#tag EndGetter
		Index As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  ' Returns True if the device is a loopback interface
			  
			  Return BitAnd(iface.flags, PCAP_IF_LOOPBACK) = PCAP_IF_LOOPBACK
			End Get
		#tag EndGetter
		Loopback As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected mIndex As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mName As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  ' Returns the machine readable device name.
			  
			  return mName
			End Get
		#tag EndGetter
		Name As String
	#tag EndComputedProperty

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
			Name="Loopback"
			Group="Behavior"
			Type="Boolean"
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
