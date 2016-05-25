#tag Class
Protected Class Filter
	#tag Method, Flags = &h1
		Protected Shared Function Compile(Expression As String, ActiveCapture As PCAP.Capture, Optimize As Integer, Netmask As UInt32 = &hffffff) As Ptr
		  Dim program As New MemoryBlock(1024 * 64)
		  Dim p As Ptr = program
		  If ActiveCapture <> Nil Then
		    Dim mb As New MemoryBlock(Expression.LenB + 1)
		    mb.CString(0) = Expression
		    Dim err As Integer = pcap_compile(ActiveCapture.Handle, p, mb, Optimize, Netmask)
		    If err <> 0 Then p = Nil
		  Else
		    'If pcap_compile_nopcap(65536, Integer(PCAP.LinkType.RAW), program, Expression, Optimize, Netmask) <> 0 Then program = Nil
		  End If
		  'Dim tmp As Ptr
		  'If program <> Nil Then tmp = program
		  'If program = Nil Or Integer(tmp) < 512 Then Return Nil
		  Return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(Expression As String, ActiveCapture As PCAP.Capture, Optimize As Boolean = False)
		  Dim opt As Integer
		  If Optimize Then opt = 1
		  mProgram = Compile(Expression, ActiveCapture, opt, 0)
		  If mProgram = Nil Then Raise New PCAPException(ActiveCapture)
		  mExpression = Expression
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
		  If mLastCompileError <> Nil Then Return mLastCompileError.CString(0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(Expression As String)
		  Dim dead As PCAP.Capture = PCAP.Capture.CreateDead()
		  Me.Constructor(Expression, dead, False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Validate(Expression As String, Optional ActiveCapture As PCAP.Capture) As PCAP.Filter
		  Dim program As Ptr = Compile(Expression, ActiveCapture, 0, 0)
		  If program <> Nil Then Return New Filter(Expression, program)
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected mExpression As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Shared mLastCompileError As MemoryBlock
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mProgram As Ptr
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
