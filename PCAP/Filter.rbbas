#tag Class
Protected Class Filter
	#tag Method, Flags = &h1
		Protected Shared Function Compile(Expression As String, ActiveCapture As PCAP.Capture, Program As MemoryBlock, Optimize As Integer, Netmask As UInt32 = &hffffff) As Boolean
		  If ActiveCapture <> Nil Then
		    Return pcap_compile(ActiveCapture.Handle, program, Expression, Optimize, Netmask) = 0
		  Else
		    If pcap_compile_nopcap(65536, Integer(PCAP.LinkType.ETHERNET), program, Expression, Optimize, Netmask) <> 0 Then program = Nil
		    Return Program <> Nil
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(Expression As String, ActiveCapture As PCAP.Capture, Optimize As Boolean = False)
		  Dim opt As Integer
		  If Optimize Then opt = 1
		  mProgram = New MemoryBlock(8)
		  mExpression = Expression
		  mSource = ActiveCapture
		  If Not Compile(mExpression, mSource, mProgram, opt, 0) Then Raise New PCAPException(Me, ActiveCapture)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Constructor(Expression As String, Program As Ptr)
		  mProgram = Program
		  mExpression = Expression
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  If mProgram <> Nil Then pcap_freecode(mProgram)
		  mProgram = Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Expression() As String
		  Return mExpression
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Handle() As Ptr
		  Return mProgram
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function LastCompileError() As String
		  Return mLastCompileError
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(Expression As String)
		  Dim dead As PCAP.Capture = PCAP.Capture.CreateDead()
		  Me.Constructor(Expression, dead, False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Source() As PCAP.Capture
		  Return mSource
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Validate(Expression As String, Optional ActiveCapture As PCAP.Capture) As PCAP.Filter
		  Try
		    If ActiveCapture = Nil Then ActiveCapture = Capture.CreateDead
		    Return New Filter(Expression, ActiveCapture)
		  Catch Err As PCAPException
		    mLastCompileError = Err.Message
		  End Try
		  
		  Return Nil
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected mExpression As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Shared mLastCompileError As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mProgram As MemoryBlock
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mSource As PCAP.Capture
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
