#tag Class
Protected Class Adaptor
	#tag Method, Flags = &h1
		Protected Function Address() As pcap_addr
		  Dim p As pcap_addr = iface.addresses.pcap_addr
		  Return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Constructor(iface As pcap_if, IfaceIndex As Integer)
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
		  
		  Dim lst() As pcap_if = GetAdaptors()
		  Return New PCAP.Adaptor(lst(Index), Index)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function GetAdaptorCount() As Integer
		  ' Returns the number of Adaptors available.
		  
		  If Not PCAP.IsAvailable Then Return -1
		  
		  Dim lst() As pcap_if = GetAdaptors()
		  Return lst.Ubound + 1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Function GetAdaptors() As pcap_if()
		  ' Returns the Adaptor at Index. The last Adaptor is at Index=GetAdaptorCount-1
		  
		  Dim ret() As pcap_if
		  If Not PCAP.IsAvailable Then Return ret
		  Dim errmsg As New MemoryBlock(PCAP_ERRBUF_SIZE)
		  If ref = Nil Then
		    #If TargetWin32 Then
		      If pcap_findalldevs_ex(PCAP_SRC_IF_STRING, Nil, ref, errmsg) <> 0 Then Raise New PCAPException(errmsg)
		    #Else
		      If pcap_findalldevs(ref, errmsg) <> 0 Then Raise New PCAPException(errmsg)
		    #endif
		  End If
		  
		  Dim lst As Ptr = ref
		  Do Until lst = Nil
		    Dim iface As pcap_if = lst.pcap_if
		    ret.Append(iface)
		    lst = iface.next_if
		  Loop
		  Return ret
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SendPacket(RawPackets() As PCAP.Packet, Synchronize As Boolean = False) As Boolean
		  ' Writes an array of packets to the adaptor. If Synchronize is True then the Packets' original timestamps are respected.
		  ' The pcap_sendqueue_* functions are only available in WinPcap; on *nix, we simulate the queue by sending the packets
		  ' ourselves in a loop. As such, the Synchronize argument is not supported on *nix.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-PCAP/wiki/PCAP.Adaptor.SendPacket
		  
		  #If TargetWin32 Then
		    Dim sz As UInt32
		    For Each p As Packet In RawPackets
		      sz = sz + p.SnapLength
		    Next
		    Dim queue As Ptr = pcap_sendqueue_alloc(sz)
		    If queue = Nil Then Raise New OutOfMemoryException ' the queue is too large to fit in available memory!
		  #else
		    If Synchronize Then Return False ' not supported on *nix
		  #endif
		  Dim ret As Boolean
		  Try
		    For i As Integer = 0 To UBound(RawPackets)
		      Dim pkt As PCAP.Packet = RawPackets(i)
		      #If TargetWin32 Then
		        If pcap_sendqueue_queue(queue, pkt.Header, pkt) <> 0 Then Raise New PCAPException("Unable to queue the packet!")
		      #Else
		        ret = Me.SendPacket(pkt)
		        If Not ret Then Exit For
		      #endif
		    Next
		    #If TargetWin32 Then
		      Dim sync As Integer
		      If Synchronize Then sync = 1
		      ret = (sz = pcap_sendqueue_transmit(iface, queue, sync))
		    #EndIf
		  Finally 
		    #If TargetWin32 Then
		      pcap_sendqueue_destroy(queue)
		    #EndIf
		  End Try
		  Return ret
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SendPacket(RawPacket As PCAP.Packet) As Boolean
		  ' Writes a packet to the adaptor.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-PCAP/wiki/PCAP.Adaptor.SendPacket
		  
		  Dim data As MemoryBlock = RawPacket.StringValue
		  Return pcap_sendpacket(iface, data, data.Size) = 0
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  ' Returns a human-readable description of the device
			  '
			  ' See:
			  ' https://github.com/charonn0/RB-PCAP/wiki/PCAP.Adaptor.Description
			  
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
			  '
			  ' See:
			  ' https://github.com/charonn0/RB-PCAP/wiki/PCAP.Adaptor.Flags
			  
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
			  '
			  ' See:
			  ' https://github.com/charonn0/RB-PCAP/wiki/PCAP.Adaptor.Index
			  
			  Return mIndex
			End Get
		#tag EndGetter
		Index As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  ' Returns True if the device is a loopback interface
			  '
			  ' See:
			  ' https://github.com/charonn0/RB-PCAP/wiki/PCAP.Adaptor.Loopback
			  
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

	#tag Property, Flags = &h21
		Private mNetMask As UInt32
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  ' Returns the machine readable device name.
			  '
			  ' See:
			  ' https://github.com/charonn0/RB-PCAP/wiki/PCAP.Adaptor.Name
			  
			  return mName
			End Get
		#tag EndGetter
		Name As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim netp, maskp As UInt32
			  Dim errmsg As New MemoryBlock(PCAP_ERRBUF_SIZE)
			  If pcap_lookupnet(Me.Name, netp, maskp, errmsg) = -1 Then
			    Raise New PCAPException(errmsg.WString(0))
			  End If
			  Return netp
			End Get
		#tag EndGetter
		NetMask As UInt32
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private Shared ref As Ptr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared refcount As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim netp, maskp As UInt32
			  Dim errmsg As New MemoryBlock(PCAP_ERRBUF_SIZE)
			  If pcap_lookupnet(Me.Name, netp, maskp, errmsg) = -1 Then
			    Raise New PCAPException(errmsg.WString(0))
			  End If
			  Return maskp
			End Get
		#tag EndGetter
		Subnet As UInt32
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  ' Returns the user-configured device name (e.g. "Local Area Connection").
			  '
			  ' See:
			  ' https://github.com/charonn0/RB-PCAP/wiki/PCAP.Adaptor.Win32Name
			  
			  #If Not TargetWin32 Then
			    Return Me.Name
			  #else
			    Dim id As String = "{" + NthField(Me.Name, "{", 2)
			    Dim r As RegistryItem
			    Dim ret As String
			    Try
			      r = New RegistryItem("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Network\{4D36E972-E325-11CE-BFC1-08002BE10318}", False)
			      r = r.Child(id)
			      r = r.Child("Connection")
			      ret = r.Value("Name")
			    Catch
			      ret = Me.Name
			    End Try
			    Return ret
			  #endif
			End Get
		#tag EndGetter
		Win32Name As String
	#tag EndComputedProperty


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
