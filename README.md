# RB-PCAP
Experimental wpcap bindings for Realbasic

##Example
This example capture approximately 64KB of packets and saves them to a file.

```vbnet
  Dim iface As PCAP.Adaptor = PCAP.GetCaptureDevice(0)
  Dim cap As PCAP.Capture = iface.Open(65536, PCAP.PCAP_OPENFLAG_PROMISCUOUS, 1000)
  Dim p As PCAP.Packet = cap.ReadNext()
  Dim bs As BinaryStream = BinaryStream.Create(SpecialFolder.Desktop.Child("out.bin"), True)
  Do Until cap.EOF Or bs.Length > 1024 * 64
    If p <> Nil Then bs.Write(p.StringValue)
    p = cap.ReadNext()
  Loop
```
