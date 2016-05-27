# RB-PCAP
Experimental [WinPcap](https://www.winpcap.org/) bindings for Realbasic Win32 applications. *nix support using libpcap is possible, but not yet implemented.

##Example
This example [captures](https://github.com/charonn0/RB-PCAP/wiki/PCAP.Capture) 64KB of [filtered](https://github.com/charonn0/RB-PCAP/wiki/PCAP.Filter) [packets](https://github.com/charonn0/RB-PCAP/wiki/PCAP.Packet) from a local network [adaptor](https://github.com/charonn0/RB-PCAP/wiki/PCAP.Adaptor) and saves them to a standard [PCAP file](https://github.com/charonn0/RB-PCAP/wiki/PCAP.DumpFile) on the user's desktop.

```vbnet
  Dim iface As PCAP.Adaptor = PCAP.GetCaptureDevice(0) ' first device
  Dim capture As PCAP.Capture = PCAP.BeginCapture(iface) ' open the device
  Dim dumpfile As New PCAP.DumpFile(capture, SpecialFolder.Desktop.Child("test.pcap")) ' create dump file
  
  Dim filter As PCAP.Filter = PCAP.Filter.Validate("host example.com", capture) ' create filter
  If filter <> Nil Then 
    capture.CurrentFilter = filter 
  Else 
    MsgBox(PCAP.Filter.LastCompileError)
  End If
  
  ' begin capturing
  Do Until capture.EOF Or dumpfile.Position > 1024 * 64
    Dim p As PCAP.Packet = capture.ReadNext() 'waits for next packet or timeout
    If p <> Nil Then dumpfile.WritePacket(p)
  Loop
  
  dumpfile.Close
  capture.Close
```
