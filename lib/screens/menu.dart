import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sample_flutter_app/util/routes.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
        centerTitle: true,
      ),
      body: _buildMenuBody(),
    );
  }

  _buildMenuBody() {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.methodChannelScreen);
            },
            child: Text("Platform channel"),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.rtcMenuScreen);
            },
            child: Text("RTC"),
          ),
        ],
      ),
    );
  }
}
