# Introduction
[libpcap](http://www.tcpdump.org/)/[WinPcap](https://www.winpcap.org/) is the usermode interface to a kernel-mode network packet capture driver for Linux, OS X and Windows operating systems. 

RB-PCAP is a libpcap/winpcap [binding](http://en.wikipedia.org/wiki/Language_binding) for Realbasic and Xojo ("classic" framework) projects. 

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
  Dim expression As String = "host boredomsoft.org and port 80 and tcp"
  Dim filter As PCAP.Filter = PCAP.Filter.Compile(expression, capture)
  
  If filter <> Nil Then
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
    
  Else
    ' invalid expression
    MsgBox(PCAP.Filter.LastCompileError)
  End If
  
  dumpfile.Close
  capture.Close
```

## How to incorporate RB-PCAP into your Realbasic/Xojo project
### Import the PCAP module
1. Download the RB-PCAP project either in [ZIP archive format](https://github.com/charonn0/RB-PCAP/archive/master.zip) or by cloning the repository with your Git client.
2. Open the RB-PCAP project in REALstudio or Xojo. Open your project in a separate window.
3. Copy the PCAP module into your project and save.

### Ensure the PCAP driver is installed
PCAP is not installed by default on most systems, and will need to be installed separately. 

* [WinPCAP download](https://www.winpcap.org/install/default.htm)
* [libpcap download](http://www.tcpdump.org/#latest-releases)

RB-PCAP will raise a PlatformNotSupportedException when used if all required DLLs/SOs/DyLibs are not available at runtime. 
