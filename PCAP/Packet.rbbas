#tag Class
Protected Class Packet
	#tag Method, Flags = &h0
		Sub Constructor(pHeader As Ptr, RawPacket As Ptr)
		  mHeader = pHeader.pcap_pkthdr
		  mRaw = RawPacket
		  mRaw.LittleEndian = False ' network byte order
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Compare(FilterProgram As PCAP.Filter) As Integer
		  ' This method overloads the comparison operator (=) allowing direct comparisons
		  ' between a packet and a filter. Returns 0 if the packet would have been captured
		  ' under the specified filter, or non-zero if not.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-PCAP/wiki/PCAP.Packet.Operator_Compare
		  
		  If FilterProgram Is Nil Then Return 1
		  Return pcap_offline_filter(FilterProgram.Handle, mHeader, mRaw)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( deprecated )  Function Operator_Convert() As Ptr
		  ' converts to a Ptr to a memory block SnapLength bytes long containing raw packet data.
		  Return mRaw
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StringValue(Offset As Integer = 0, Length As Integer = - 1) As String
		  If mRaw = Nil Then Return ""
		  If Offset < 0 Then Offset = 0
		  If Length < 0 Then Length = SnapLength - Offset
		  If Offset + Length > SnapLength Then Raise New OutOfBoundsException
		  Return mRaw.StringValue(Offset, Length)
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mHeader
			End Get
		#tag EndGetter
		Attributes( hidden = true ) Header As pcap_pkthdr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  ' the length of the original packet (not necessarily the length of the captured data; see SnapLength)
			  Return mHeader.len
			End Get
		#tag EndGetter
		Length As UInt32
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected mHeader As pcap_pkthdr
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mRaw As MemoryBlock
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  ' the length of the captured data, which may be less than or equal to the length of the original packet
			  Return mHeader.caplen
			End Get
		#tag EndGetter
		SnapLength As UInt32
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return CDbl(Str(mHeader.ts.tv_sec) + "." + Str(mHeader.ts.tv_usec))
			End Get
		#tag EndGetter
		TimeStamp As Double
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
