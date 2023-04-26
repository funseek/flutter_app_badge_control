import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_app_badge_control/flutter_app_badge_control.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _flutterAppBadgeControlPlugin = FlutterAppBadgeControl();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion =
          await _flutterAppBadgeControlPlugin.getPlatformVersion() ??
              'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              Text('Running on: $_platformVersion\n'),
              ElevatedButton(
                onPressed: () async {
                  await FlutterAppBadgeControl.updateBadgeCount(1);
                },
                child: const Text('Update Badge Count'),
              ),
              ElevatedButton(
                onPressed: () async {
                  await FlutterAppBadgeControl.removeBadge();
                },
                child: const Text('Remove Badge'),
              ),
              ElevatedButton(
                onPressed: () async {
                  bool isSupported =
                      await FlutterAppBadgeControl.isAppBadgeSupported();
                  // ignore: avoid_print
                  print('isSupported: $isSupported');
                },
                child: const Text('Is App Badge Supported'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
