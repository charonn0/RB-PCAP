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

	#tag Method, Flags = &h1
		Protected Sub Constructor(pcap_t As Ptr)
		  mHandle = pcap_t
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Create(CaptureDevice As PCAP.Adaptor, SnapLength As Integer = 65536, TimeOut As Integer = 1000, Flags As Integer = 0) As PCAP.Capture
		  Dim p As Ptr
		  Dim errmsg As New MemoryBlock(PCAP_ERRBUF_SIZE)
		  p = pcap_open(CaptureDevice.Name, SnapLength, Flags, TimeOut, Nil, errmsg)
		  If p <> Nil Then
		    Dim ret As New PCAP.Capture(p)
		    Return ret
		  Else
		    Dim err As New IOException
		    err.Message = errmsg
		    Raise err
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function CreateDead(LinkType As PCAP.LinkType = PCAP.LinkType.RAW, SnapLength As Integer = 65536) As PCAP.Capture
		  Dim p As Ptr
		  Dim errmsg As New MemoryBlock(PCAP_ERRBUF_SIZE)
		  p = pcap_open_dead(LinkType, SnapLength)
		  If p <> Nil Then
		    Dim ret As New PCAP.Capture(p)
		    Return ret
		  Else
		    Dim err As New IOException
		    err.Message = errmsg
		    Raise err
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CurrentFilter() As PCAP.Filter
		  Return mCurrentFilter
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CurrentFilter(Assigns NewFilterProgram As PCAP.Filter)
		  If pcap_setfilter(mHandle, NewFilterProgram.Handle) <> 0 Then Raise New RuntimeException
		  mCurrentFilter = NewFilterProgram
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EOF() As Boolean
		  Return mEOF
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Handle() As Ptr
		  Return mHandle
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Open(CaptureFile As FolderItem, SnapLength As Integer = 65536, Flags As Integer = 0) As PCAP.Capture
		  If Not PCAP.IsAvailable Then Raise New PlatformNotSupportedException
		  Dim p As Ptr
		  Dim errmsg As New MemoryBlock(PCAP_ERRBUF_SIZE)
		  p = pcap_open(PCAP_SRC_FILE_STRING + CaptureFile.AbsolutePath, SnapLength, Flags, 1000, Nil, errmsg)
		  If p <> Nil Then
		    Dim ret As New PCAP.Capture(p)
		    Return ret
		  Else
		    Dim err As New IOException
		    err.Message = errmsg
		    Raise err
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReadNext() As PCAP.Packet
		  Dim h, d As Ptr
		  Dim ret As PCAP.Packet
		  
		  Select Case pcap_next_ex(mHandle, h, d)
		  Case 1 ' ok
		    Dim pk As pcap_pkthdr = h.pcap_pkthdr
		    ret = New PCAP.Packet(pk, d)
		    
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


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mHandle <> Nil Then Return pcap_datalink(mHandle)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mHandle <> Nil Then
			    If pcap_set_datalink(mHandle, value) <> 0 Then Raise New RuntimeException
			  End If
			End Set
		#tag EndSetter
		DataLink As PCAP.LinkType
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected mCurrentFilter As PCAP.Filter
	#tag EndProperty

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
