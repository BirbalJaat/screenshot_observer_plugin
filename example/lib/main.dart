import 'package:flutter/material.dart';
import 'dart:async';
import 'package:screenshot_observer_plugin/screenshot_observer_plugin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String text = "Ready for take screenshot.";
  late ScreenshotObserverPlugin screenshotCallback;

  @override
  void initState() {
    super.initState();
    initScreenshotCallback();
  }

  //It must be created after permission is granted.
  Future<void> initScreenshotCallback() async {
    screenshotCallback = ScreenshotObserverPlugin();
    screenshotCallback.addListenerCallback(() {
      setState(() {
        text = "Screenshot callback will trigger here...";
      });
    });

  }


  @override
  void dispose() {
    screenshotCallback.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Screenshot observer Plugin Example'),
        ),
        body: Center(
          child: Text(text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )),
        ),
      ),
    );
  }
}
