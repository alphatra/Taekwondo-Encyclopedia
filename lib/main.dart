import 'package:flutter/material.dart';
import 'Controlersite.dart';
import 'package:appcenter/appcenter.dart';
import 'package:appcenter_analytics/appcenter_analytics.dart';
import 'package:appcenter_crashes/appcenter_crashes.dart';
import 'package:device_simulator/device_simulator.dart';
const String videoPlacementId='video';
const String gameIdAndroid='3364163';
const bool debugEnableDeviceSimulator = true;
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {

  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taekwondo',
      debugShowCheckedModeBanner: false,
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