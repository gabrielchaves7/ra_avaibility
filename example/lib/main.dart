import 'package:flutter/cupertino.dart';
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
  bool _supported;
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
            SizedBox(
              height: 24,
            ),
            Center(
              child: Text(
                'Click at the button bellow to check if device support AR.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                    fontWeight: FontWeight.w800),
              ),
            ),
            FlatButton(
              color: Colors.black,
              onPressed: () {
                initPlatformState();
              },
              child: Text(
                "Check",
                style: TextStyle(color: Colors.white),
              ),
            ),
            exibirResultado
                ? Text(
                    _supported.toString(),
                    style: TextStyle(
                      fontSize: 32,
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
