#tag Class
Protected Class Filter
	#tag Method, Flags = &h1
		Protected Shared Function Compile(Expression As String, ActiveCapture As PCAP.Capture, Optimize As Integer, Netmask As UInt32) As Ptr
		  Dim program As Ptr
		  If pcap_compile(ActiveCapture.Handle, program, Expression, Optimize, Netmask) <> 0 Then Return Nil
		  Return program
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(Expression As String, ActiveCapture As PCAP.Capture, Optimize As Boolean = False)
		  Dim opt As Integer
		  If Optimize Then opt = 1
		  Dim prgm As Ptr = Compile(Expression, ActiveCapture, opt, 0)
		  If prgm = Nil Then Raise New RuntimeException
		  Me.Constructor(Expression, prgm)
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
		Sub Operator_Convert(Expression As String)
		  'Me.Constructor(Expression, Capture.CreateDead, False)
		  Me.Constructor(Expression, Capture.Create(GetCaptureDevice(0)), False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Validate(Expression As String, Optional ActiveCapture As PCAP.Capture) As PCAP.Filter
		  If ActiveCapture = Nil Then ActiveCapture = Capture.CreateDead
		  Dim program As Ptr = Compile(Expression, ActiveCapture, 0, 0)
		  If program <> Nil Then Return New Filter(Expression, program)
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected mExpression As String
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
