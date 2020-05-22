import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:raavailability/raavailability.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _supported = false;
  bool exibirResultado = false;

  @override
  void initState() {
    super.initState();
  }

  Future<void> initPlatformState() async {
    bool supported;
    try {
      supported = await Raavailability.isSupported;
    } on PlatformException {
      supported = false;
    }

    if (!mounted) return;

    setState(() {
      _supported = supported;
      exibirResultado = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('RA Availability example'),
        ),
        body: Column(
          children: <Widget>[
            Center(
              child: Text(
                  'Click at the button bellow to check if device support AR.'),
            ),
            FlatButton(
              color: Colors.green,
              onPressed: () {
                initPlatformState();
              },
              child: Text("Check"),
            ),
            exibirResultado ? Text(_supported.toString()) : Container(),
          ],
        ),
      ),
    );
  }
}
