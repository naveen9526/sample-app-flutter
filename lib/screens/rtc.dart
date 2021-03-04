import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample_flutter_app/screens/videoCalling/call_sample.dart';

class RtcMenuScreen extends StatefulWidget {
  @override
  _RtcMenuScreenState createState() => _RtcMenuScreenState();
}

class _RtcMenuScreenState extends State<RtcMenuScreen> {

  final String _server = 'demo.cloudwebrtc.com';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RTC"),
        centerTitle: true,
      ),
      body: Align(
        alignment: Alignment.center,
        child: RaisedButton(
          onPressed: () {
//            getMacAddress();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => CallSample(host: _server)));
          },
          child: Text("Video calling"),
        ),
      ),
    );;
  }
}
