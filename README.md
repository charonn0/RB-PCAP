# RB-PCAP
[libpcap](http://www.tcpdump.org/)/[WinPcap](https://www.winpcap.org/) bindings for Realbasic and Xojo.

## Example
This example [captures](https://github.com/charonn0/RB-PCAP/wiki/PCAP.Capture) 64KB of [filtered](https://github.com/charonn0/RB-PCAP/wiki/PCAP.Filter) [packets](https://github.com/charonn0/RB-PCAP/wiki/PCAP.Packet) from a local network [adaptor](https://github.com/charonn0/RB-PCAP/wiki/PCAP.Adaptor) and saves them to a standard [PCAP file](https://github.com/charonn0/RB-PCAP/wiki/PCAP.DumpFile) on the user's desktop.

```vbnet
  ' get the first available device
  Dim iface As PCAP.Adaptor = PCAP.GetCaptureDevice(0)
  ' open the device
  Dim capture As PCAP.Capture = PCAP.BeginCapture(iface) 
  ' create a file to write packets to
  Dim dumpfile As New PCAP.DumpFile(capture, SpecialFolder.Desktop.Child("test.pcap"))
  
 ' create a filter program
  Dim expression As String = "host example.net and port 80 and tcp"
  Dim filter As PCAP.Filter = PCAP.Filter.Compile(expression, capture)
  If filter = Nil Then
   ' invalid expression
    MsgBox(PCAP.Filter.LastCompileError)

  Else
    ' assign the filter to the capture
    capture.CurrentFilter = filter   
   ' begin reading packets from the capture buffer
    Do Until capture.EOF Or dumpfile.Position > 1024 * 64
      'wait for next packet or timeout
      Dim p As PCAP.Packet = capture.ReadNext() 
      If p <> Nil Then
        ' a packet was received before timeout
        ' write it to the file
        dumpfile.WritePacket(p)
      End If
    Loop
  End If
  
  dumpfile.Close
  capture.Close
```
