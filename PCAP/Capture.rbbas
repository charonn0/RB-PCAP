#tag Class
Protected Class Capture
	#tag Method, Flags = &h0
		Sub Close()
		  If mHandle <> Nil Then
		    pcap_close(mHandle)
		    mHandle = Nil
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(pcap_t As Ptr)
		  mHandle = pcap_t
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EOF() As Boolean
		  Return mEOF
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReadNext() As PCAP.Packet
		  Dim h, d As Ptr
		  Dim ret As PCAP.Packet
		  
		  Select Case pcap_next_ex(mHandle, h, d)
		  Case 1 ' ok
		    Dim pk As pcap_pkthdr = h.pcap_pkthdr
		    Dim data As MemoryBlock = d
		    data = data.StringValue(0, pk.caplen)
		    data.LittleEndian = False ' network byte order
		    ret = New PCAP.Packet(pk, data)
		    
		  Case 0 ' timeout
		    Return Nil
		    
		  Case -1 ' error
		    Raise New IOException
		    
		  Case -2 ' eof
		    mEOF = True
		    
		  Else
		    Raise New IOException
		    
		  End Select
		  
		  If ret = Nil Then Break
		  Return ret
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


	#tag Property, Flags = &h1
		Protected mEOF As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mHandle As Ptr
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
