#tag Class
Protected Class Capture
	#tag Method, Flags = &h0
		Sub BreakLoop()
		   pcap_breakloop(mHandle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Close()
		  If mHandle <> Nil Then 
		    pcap_close(mHandle)
		    Instances.Remove(Token)
		  End If
		  mHandle = Nil
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(pcap_t As Ptr)
		  mHandle = pcap_t
		  PacketTimer = New Timer
		  AddHandler PacketTimer.Action, WeakAddressOf PacketTimerHandler
		  PacketTimer.Period = 100
		  If Instances = Nil Then Instances = New Dictionary
		  Static mtoken As Integer
		  mtoken = mtoken + 1
		  Token = mtoken
		  Instances.Value(Token) = Me
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Dispatch(Count As Integer) As Integer
		  Return pcap_dispatch(mHandle, Count, AddressOf _pcapCallback, Ptr(Token))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DoLoop(Count As Integer) As Integer
		  Return pcap_loop(mHandle, Count, AddressOf _pcapCallback, Ptr(Token))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PacketTimerHandler(Sender As Timer)
		  If UBound(Pending) > -1 Then
		    Sender.Mode = Timer.ModeOff
		    RaiseEvent PacketsAvailable()
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Attributes( hidden = true ) Private Sub pcapCallback(Header As pcap_pkthdr, HeaderRaw As Ptr)
		  Pending.Insert(0, New PCAP.Packet(header, headerraw))
		  PacketTimer.Mode = Timer.ModeMultiple
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Poll()
		  Call pcap_next(mHandle, Nil)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReadNextPacket() As PCAP.Packet
		  If UBound(Pending) > -1 Then Return Pending.Pop
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Statistics() As pcap_stat
		  Dim stat As pcap_stat
		  Dim p As Ptr = New MemoryBlock(stat.Size)
		  If pcap_stats(mHandle, p) = 0 Then
		    Dim mb As MemoryBlock = p
		    stat.StringValue(TargetLittleEndian) = mb.StringValue(0, stat.Size)
		    Return stat
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Attributes( hidden = true ) Private Shared Sub _pcapCallback(UserData As Ptr, Header As pcap_pkthdr, HeaderRaw As Ptr)
		  #pragma X86CallingConvention StdCall
		  Dim instance As PCAP.Capture = Instances.Lookup(Integer(UserData), Nil)
		  If instance <> Nil Then
		    instance.pcapCallback(header, headerraw)
		  Else
		    Break
		  End If
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event PacketsAvailable()
	#tag EndHook


	#tag Property, Flags = &h21
		Private Shared Instances As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mHandle As Ptr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private PacketTimer As Timer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Pending() As PCAP.Packet
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Token As Integer
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
