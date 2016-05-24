# RB-PCAP
Experimental wpcap bindings for Realbasic

##Example
This example captures 64KB of packets from a local network adaptor and saves them to a standard PCAP file on the user's desktop.

```vbnet
  Dim iface As PCAP.Adaptor = PCAP.GetCaptureDevice(0)
  Dim cap As PCAP.Capture = PCAP.BeginCapture(iface, True) ' true=promiscuous 
  
  Dim dump As New PCAP.DumpFile(cap, SpecialFolder.Desktop.Child("test.pcap"))
  Do Until cap.EOF Or dump.Position > 1024 * 64
    Dim p As PCAP.Packet = cap.ReadNext()
    If p <> Nil Then dump.WritePacket(p)
  Loop
  dump.Close
  cap.Close
```
