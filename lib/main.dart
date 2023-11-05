import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'menu.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Fonts',
      // Set Raleway as the default app font.
      home: const Menu(),
      debugShowCheckedModeBanner: false
    );
  }
}

