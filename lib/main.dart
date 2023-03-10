import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: MyApp(),
    ),
  );
}

/// Main widget in the app
class MyApp extends StatefulWidget {
  /// Constructor of the main widget
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  final Random _random = Random();
  Color _backgroundColor = Colors.black;
  Color _textColor = Colors.white;

  void _changeColors() {
    const int maxRgb = 256;
    const double luminanceThreshold = 0.5;

    setState(() {
      _backgroundColor = Color.fromRGBO(
        _random.nextInt(maxRgb),
        _random.nextInt(maxRgb),
        _random.nextInt(maxRgb),
        1,
      );

      _textColor = _backgroundColor.computeLuminance() < luminanceThreshold
          ? Colors.white
          : Colors.black87;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: InkWell(
        onTap: _changeColors,
        enableFeedback: false,
        child: Center(
          child: Text(
            'Hey there',
            style: TextStyle(fontSize: 50, color: _textColor),
          ),
        ),
      ),
    );
  }
}
