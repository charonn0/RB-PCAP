#tag Class
Protected Class Capture
	#tag Method, Flags = &h0
		Sub Close()
		  ' Discontinues the packet capture and frees all resources.
		  
		  mCurrentFilter = Nil
		  mSource = Nil
		  mEOF = True
		  If mHandle <> Nil Then pcap_close(mHandle)
		  mHandle = Nil
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Constructor(pcap_t As Ptr)
		  If Not PCAP.IsAvailable Then Raise New PlatformNotSupportedException
		  mHandle = pcap_t
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Create(CaptureDevice As PCAP.Adaptor, SnapLength As Integer, TimeOut As Integer, Flags As Integer, BufferSize As Integer = -1) As PCAP.Capture
		  If Not PCAP.IsAvailable Then Return Nil
		  
		  Dim p As Ptr
		  Dim errmsg As New MemoryBlock(PCAP_ERRBUF_SIZE)
		  #If TargetWin32 Then
		    p = pcap_open(CaptureDevice.Name, SnapLength, Flags, TimeOut, Nil, errmsg)
		  #else
		    p = pcap_open_live(CaptureDevice.Name, SnapLength, Flags, TimeOut, errmsg)
		  #endif
		  If p <> Nil Then
		    Dim ret As New PCAP.Capture(p)
		    ret.mSource = CaptureDevice
		    If BufferSize > 0 Then
		      #If TargetWin32 Then
		        Dim err As Integer = pcap_setbuff(ret.mHandle, BufferSize)
		      #Else
		        ' untested
		        Dim err As Integer = pcap_set_buffer_size(ret.mHandle, BufferSize)
		      #endif
		      If err <> 0 Then Raise New PCAPException("Unable to set buffer size!")
		    End If
		    Return ret
		  Else
		    Dim err As New IOException
		    err.Message = errmsg
		    Raise err
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function CreateDead(LinkType As PCAP.LinkType, SnapLength As Integer) As PCAP.Capture
		  If Not PCAP.IsAvailable Then Return Nil
		  
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
		  If mHandle = Nil Then Raise New PCAPException("No capture in progress")
		  If Not (NewFilterProgram.Source Is Me) Then ' Filters may not be shared among capture instances
		    ' recompile the expression for the current instance
		    NewFilterProgram = PCAP.Filter.Compile(NewFilterProgram.Expression, Me, NewFilterProgram.IsOptimized)
		    If NewFilterProgram = Nil Then Raise New PCAPException(PCAP.Filter.LastCompileError)
		  End If
		  If pcap_setfilter(mHandle, NewFilterProgram.Handle) <> 0 Then Raise New PCAPException(Me)
		  mCurrentFilter = NewFilterProgram
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  Me.Close
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EOF() As Boolean
		  Return mEOF
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Epoch() As Double
		  Return mEpoch
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetStatistics() As pcap_stat
		  If mHandle = Nil Then Raise New PCAPException("No capture in progress")
		  #If TargetWin32 Then
		    Dim stat As Ptr
		    Dim count As Integer
		    stat = pcap_stats_ex(mHandle, count)
		    If count = 0 Then Raise New PCAPException(Me)
		    Return stat.pcap_stat
		  #Else
		    Dim stat As pcap_stat
		    If pcap_stats(mHandle, stat) <> 0 Then Raise New PCAPException(Me)
		    Return stat
		  #EndIf
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Handle() As Ptr
		  Return mHandle
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastError() As String
		  Dim mb As MemoryBlock = pcap_geterr(mHandle)
		  If mb <> Nil Then Return mb.CString(0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Open(CaptureFile As FolderItem, SnapLength As Integer, Flags As Integer) As PCAP.Capture
		  If Not PCAP.IsAvailable Then Return Nil
		  
		  If Not PCAP.IsAvailable Then Raise New PlatformNotSupportedException
		  Dim p As Ptr
		  Dim errmsg As New MemoryBlock(PCAP_ERRBUF_SIZE)
		  #if TargetWin32 Then
		    p = pcap_open(PCAP_SRC_FILE_STRING + CaptureFile.AbsolutePath, SnapLength, Flags, 0, Nil, errmsg)
		  #else
		    p = pcap_open_offline(CaptureFile.AbsolutePath, errmsg)
		  #endif
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
		  If mHandle = Nil Then Raise New PCAPException("No capture in progress")
		  
		  Dim h, d As Ptr
		  Dim ret As PCAP.Packet
		  
		  Select Case pcap_next_ex(mHandle, h, d)
		  Case 1 ' ok
		    ret = New PCAP.Packet(h, d)
		    If mEpoch < 1.0 Then mEpoch = ret.TimeStamp
		    mEOF = False
		    
		  Case 0 ' timeout
		    Return Nil
		    
		  Case -1 ' error
		    Raise New PCAPException(Me)
		    
		  Case -2 ' eof
		    mEOF = True
		    
		  Else
		    Raise New PCAPException(Me)
		    
		  End Select
		  
		  Return ret
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Source() As PCAP.Adaptor
		  Return mSource
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim errbuf As New MemoryBlock(PCAP_ERRBUF_SIZE)
			  Dim blocked As Integer = pcap_getnonblock(mHandle, errbuf)
			  If blocked = -1 Then Raise New PCAPException(errbuf.WString(0))
			  Return blocked = 0
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Dim errbuf As New MemoryBlock(PCAP_ERRBUF_SIZE)
			  Dim block As Integer
			  If Not value Then block = 1
			  If pcap_setnonblock(mHandle, block, errbuf) <> 0 Then
			    Raise New PCAPException(errbuf.WString(0))
			  End If
			End Set
		#tag EndSetter
		Blocking As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mHandle <> Nil Then Return pcap_datalink(mHandle)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mHandle <> Nil Then
			    If pcap_set_datalink(mHandle, value) <> 0 Then Raise New PCAPException(Me)
			  End If
			End Set
		#tag EndSetter
		DataLink As PCAP.LinkType
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Try
			    Return Me.GetStatistics.ps_drop
			  Catch
			    Return 0
			  End Try
			End Get
		#tag EndGetter
		DropCount As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mSource <> Nil
			End Get
		#tag EndGetter
		IsLive As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected mCurrentFilter As PCAP.Filter
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mEOF As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mEpoch As Double
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mHandle As Ptr
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mMinMemoryToCopy
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If pcap_setmintocopy(mHandle, value) = 0 Then
			    mMinMemoryToCopy = value
			  Else
			    Raise New PCAPException(Me)
			  End If
			End Set
		#tag EndSetter
		MinMemoryToCopy As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mMinMemoryToCopy As Integer = 16000
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mSource As PCAP.Adaptor
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Try
			    Return Me.GetStatistics.ps_recv
			  Catch
			    Return 0
			  End Try
			End Get
		#tag EndGetter
		PacketCount As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mHandle <> Nil Then Return pcap_snapshot(mHandle)
			  Return -1
			End Get
		#tag EndGetter
		SnapLength As Integer
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="DropCount"
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
			Name="IsLive"
			Group="Behavior"
			Type="Boolean"
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
			Name="PacketCount"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SnapLength"
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
	#tag EndViewBehavior
End Class
#tag EndClass
