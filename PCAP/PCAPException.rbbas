#tag Class
Protected Class PCAPException
Inherits RuntimeException
	#tag Method, Flags = &h0
		Sub Constructor(ActiveCapture As PCAP.Capture)
		  If ActiveCapture <> Nil Then
		    Me.Message = GetError(ActiveCapture)
		    If Me.Message.Trim = "" Then Me.Message = "Unknown PCAP error"
		  Else
		    Me.Message = "Unknown error"
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(BadFilter As PCAP.Filter, ActiveCapture As PCAP.Capture)
		  Me.Constructor(ActiveCapture)
		  Me.Message = Me.Message + EndOfLine + "Filter: " + BadFilter.Expression
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(ErrMsg As String)
		  Me.Message = ErrMsg
		End Sub
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="ErrorNumber"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="RuntimeException"
		#tag EndViewProperty
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
			Name="Message"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="RuntimeException"
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
