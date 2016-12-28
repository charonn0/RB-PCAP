#tag Class
Protected Class DumpFile
	#tag Method, Flags = &h0
		Sub Close()
		  If mDump <> Nil Then pcap_dump_close(mDump)
		  mDump = Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(ActiveCapture As PCAP.Capture, DumpTo As FolderItem)
		  If Not PCAP.IsAvailable Then Raise New PlatformNotSupportedException
		  
		  mDump = pcap_dump_open(ActiveCapture.Handle, DumpTo.AbsolutePath)
		  If mDump = Nil Then Raise New PCAPException(ActiveCapture)
		  mDumpFile = DumpTo
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  Me.Close()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Flush()
		  If mDump <> Nil And pcap_dump_flush(mDump) <> 0 Then Raise New IOException
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As BinaryStream
		  Dim fhandle As Integer = pcap_dump_file(mDump)
		  #If TargetWin32 Then
		    'Soft Declare Function _fileno Lib "msvcrt" (FileStream As Integer) As Integer
		    'Soft Declare Function _get_osfhandle Lib "msvcrt" (FileDescriptor As Integer) As Integer
		    'If fhandle > 0 Then fhandle = _fileno(fhandle)
		    'If fhandle > 0 Then fhandle = _get_osfhandle(fhandle)
		    If fhandle > 0 Then Return New BinaryStream(fhandle, BinaryStream.HandleTypeWin32Handle)
		  #Else
		    Return New BinaryStream(fhandle, BinaryStream.HandleTypeFileNumber)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WritePacket(Packet As PCAP.Packet)
		  Dim h As pcap_pkthdr = Packet.Header
		  If mDump <> Nil Then pcap_dump(mDump, h, Packet)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mDump As Ptr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDumpFile As FolderItem
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mDump <> Nil Then Return pcap_dump_ftell(mDump)
			End Get
		#tag EndGetter
		Position As Integer
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
			Name="Position"
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
