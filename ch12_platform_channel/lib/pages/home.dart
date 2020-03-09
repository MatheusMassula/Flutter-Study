import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const _methodChannel = const MethodChannel('platformchannel.companyname.com/deviceinfo');
  String _deviceInfo = '';

  Future<void> _getDeviceInfo() async {
    String deviceInfo = '';
    try {
      deviceInfo = await _methodChannel.invokeMethod('getDeviceInfo');
    } on PlatformException catch (e) {
      deviceInfo = 'Failed to get device info: ${e.message}';
    }
    setState(() {
      _deviceInfo = deviceInfo;
    });
  }
  
  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                'Device info:',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),
              ),
              subtitle: Text(
                _deviceInfo,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey
                ),
              ),
              contentPadding: const EdgeInsets.all(16),
            ),

            RaisedButton(
              child: Text('get device info'),
              onPressed: _getDeviceInfo
            )
          ],
        )
      ),
    );
  }
}