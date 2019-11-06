import 'package:flutter/material.dart';
import 'Controlersite.dart';
import 'package:appcenter/appcenter.dart';
import 'package:appcenter_analytics/appcenter_analytics.dart';
import 'package:appcenter_crashes/appcenter_crashes.dart';
import 'package:device_simulator/device_simulator.dart';
const bool debugEnableDeviceSimulator = true;
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {

  @override

  Widget build(BuildContext context) {

    var now = new DateTime.now();
    var fiveMinutesFromNow = now.add(new Duration(seconds: 5));
    debugPrint(now.toString()+'  '+fiveMinutesFromNow.toString());
    return MaterialApp(
      title: 'Taekwondo',
      theme: ThemeData(
          fontFamily: 'Roboto',
      ),
      home:  DeviceSimulator(
      brightness: Brightness.dark,
    enable: debugEnableDeviceSimulator,
    child: Scaffold(
    body: MyPage())));
  }
}