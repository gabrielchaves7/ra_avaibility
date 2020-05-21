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
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: <Widget>[
            Center(
              child: Text('Verifique se o dispositivo suporta RA clicando no botão abaixo'),
            ),
            FlatButton(
              color: Colors.blue,
              onPressed: (){
                initPlatformState();
              },
              child: Text("Verificar"),
            ),
            exibirResultado ?
            Text(
              _supported.toString()
            ) : Container(),
          ],
        ),
      ),
    );
  }
}
