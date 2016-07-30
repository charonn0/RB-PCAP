#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  Dim f As PCAP.Filter = PCAP.Filter.Compile("tcp")', c)
		  If f <> Nil Then
		    Dim i As Integer = Integer(f.Handle)
		    Dim c As PCAP.Capture = PCAP.OpenCapture(SpecialFolder.Desktop.Child("test.pcap"))
		    c.CurrentFilter = f
		    Dim x As Integer = Integer(f.Handle)
		    Dim y As Integer = Integer(c.CurrentFilter.Handle)
		    Break
		    Do Until c.EOF
		      Dim p As PCAP.Packet = c.ReadNext
		      If p <> Nil Then System.DebugLog(Str(p.SnapLength))
		    Loop
		    c.Close
		  Else
		    Break
		  End If
		End Sub
	#tag EndEvent


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
