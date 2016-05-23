#tag Class
Protected Class Packet
	#tag Method, Flags = &h0
		Sub Constructor(pHeader As pcap_pkthdr, RawPacket As MemoryBlock)
		  mHeader = pHeader
		  mRaw = RawPacket
		  mRaw.LittleEndian = False ' network byte order
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Header() As pcap_pkthdr
		  Return mHeader
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Length() As UInt32
		  Return mHeader.caplen
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( hidden )  Function Raw() As Ptr
		  If mRaw <> Nil Then Return mRaw
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StringValue() As String
		  'mRaw.LittleEndian = False ' network byte order
		  Return mRaw.StringValue(0, mHeader.caplen)
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
