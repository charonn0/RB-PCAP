#tag Class
Class PacketFilter
	#tag Method, Flags = &h0
		Sub Constructor()
		  mWorker = New Thread
		  mWorker.Priority = Thread.LowestPriority
		  AddHandler mWorker.Run, WeakAddressOf ThreadRunHandler
		  mCaptureLock = New Semaphore
		  mEventTimer = New Timer
		  mEventTimer.Period = 1
		  AddHandler mEventTimer.Action, WeakAddressOf EventTimerHandler
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub EventTimerHandler(Sender As Timer)
		  If Not mCaptureLock.TrySignal Then Return
		  Try
		    Do Until UBound(mPackets) = -1
		      RaiseEvent PacketArrived(mPackets.Pop)
		    Loop
		  Finally
		    mCaptureLock.Release
		  End Try
		  Sender.Mode = Timer.ModeOff
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Pause()
		  mKill = True
		  Do Until mCaptureLock.TrySignal
		    App.YieldToNextThread
		  Loop
		  Try
		    Select Case mWorker.State
		    Case Thread.Running, Thread.Waiting, Thread.Sleeping
		      mWorker.Suspend
		    Case Thread.Suspended, mWorker.NotRunning
		      //meh
		    End Select
		  Finally
		    mCaptureLock.Release
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Start()
		  mKill = False
		  Do Until mCaptureLock.TrySignal
		    App.YieldToNextThread
		  Loop
		  Try
		    Select Case mWorker.State
		    Case Thread.Running, Thread.Waiting, Thread.Sleeping
		      Return
		    Case Thread.Suspended
		      mWorker.Resume
		    Case mWorker.NotRunning
		      mWorker.Run
		    End Select
		  Finally
		    mCaptureLock.Release
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Stop()
		  mKill = True
		  Do Until mCaptureLock.TrySignal
		    App.YieldToNextThread
		  Loop
		  Try
		    Select Case mWorker.State
		    Case Thread.Running, Thread.Waiting, Thread.Sleeping, Thread.Suspended, Thread.Running
		      mWorker.Kill
		    End Select
		  Finally
		    mCaptureLock.Release
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ThreadRunHandler(Sender As Thread)
		  #pragma Unused Sender
		  mKill = False
		  Do
		    Do Until mCaptureLock.TrySignal
		      App.YieldToNextThread
		    Loop
		    Dim p As PCAP.Packet
		    Try
		      Do Until mKill
		        p = mSource.ReadNext()
		        If p <> Nil Then mPackets.Insert(0, p)
		      Loop Until p = Nil
		    Finally
		      mCaptureLock.Release
		    End Try
		    mEventTimer.Mode = Timer.ModeMultiple
		    App.YieldToNextThread
		  Loop
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event PacketArrived(NewPacket As PCAP.Packet)
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mSource.CurrentFilter
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Do Until mCaptureLock.TrySignal
			    App.YieldToNextThread
			  Loop
			  Try
			    mSource.CurrentFilter = value
			  Finally
			    mCaptureLock.Release
			  End Try
			End Set
		#tag EndSetter
		CurrentFilter As PCAP.Filter
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mCaptureLock As Semaphore
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mEventTimer As Timer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mKill As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPackets() As PCAP.Packet
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSource As PCAP.Capture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mWorker As Thread
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mWorker.Priority
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mWorker.Priority = value
			End Set
		#tag EndSetter
		Priority As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mSource
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Do Until mCaptureLock.TrySignal
			    App.YieldToNextThread
			  Loop
			  Try
			    mSource = value
			  Finally
			    mCaptureLock.Release
			  End Try
			End Set
		#tag EndSetter
		Source As PCAP.Capture
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
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
