import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MethodChannelScreen extends StatefulWidget {
  @override
  _MethodChannelScreenState createState() => _MethodChannelScreenState();
}

class _MethodChannelScreenState extends State<MethodChannelScreen> {

  static const platform = const MethodChannel('macAddress');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Method Channel"),
        centerTitle: true,
      ),
      body: Align(
        alignment: Alignment.center,
        child: RaisedButton(
          onPressed: () {
            getMacAddress();
          },
          child: Text("Click Here"),
        ),
      ),
    );
  }

  getMacAddress() async {
    final String result = await platform.invokeMethod('macAddress');

    if (result != 'empty') {
      print("======macAddress is $result");
    } else {
      print("========Method Channel demo failed");
    }
  }
}
