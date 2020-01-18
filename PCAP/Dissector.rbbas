#tag Class
Protected Class Dissector
	#tag Method, Flags = &h0
		Sub Constructor(Source As PCAP.Packet)
		  mPacket = Source
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		Checksum As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		DestAddress As UInt32
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		DSCP As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		ECN As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		Flags As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		ID As UInt16
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		IHL As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim mb As MemoryBlock = mPacket.StringValue(0, 1)
			  Dim vlu As UInt8 = ShiftLeft(mb.UInt8Value(0), 4)
			  Return vlu
			End Get
		#tag EndGetter
		IPVersion As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		Length As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mPacket As PCAP.Packet
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		Options As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		Protocol As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		SourceAddress As UInt32
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		TTL As Integer
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Checksum"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DSCP"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ECN"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Flags"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IHL"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IPVersion"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Length"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Options"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Protocol"
			Group="Behavior"
			Type="Integer"
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
		#tag ViewProperty
			Name="TTL"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
