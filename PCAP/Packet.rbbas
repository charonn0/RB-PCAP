#tag Class
Protected Class Packet
	#tag Method, Flags = &h0
		Sub Constructor(pHeader As pcap_pkthdr, RawPacket As Ptr)
		  mHeader = pHeader
		  mRaw = RawPacket
		  mRaw = mRaw.StringValue(0, pHeader.caplen)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Header() As pcap_pkthdr
		  Return mHeader
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Length() As UInt32
		  ' the length of the original packet (not necessarily the length of the captured data; see SnapLength)
		  Return mHeader.len
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As Ptr
		  ' converts to a Ptr to a memory block SnapLength bytes long containing raw packet data.
		  Return mRaw
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SnapLength() As UInt32
		  ' the length of the captured data, which may be less or equal to than the length of the original packet
		  Return mHeader.caplen
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StringValue() As String
		  If mRaw = Nil Then Return ""
		  Dim tmp As MemoryBlock = mRaw
		  tmp.LittleEndian = False ' network byte order
		  Return tmp.StringValue(0, mHeader.caplen)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TimeStamp() As Double
		  Return CDbl(Str(mHeader.ts.tv_sec) + "." + Str(mHeader.ts.tv_usec))
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected mHeader As pcap_pkthdr
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mRaw As MemoryBlock
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
