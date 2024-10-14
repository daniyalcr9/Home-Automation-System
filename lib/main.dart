import 'package:flutter/material.dart';
import 'login_screen.dart';

void main() => runApp(SmartHomeApp());

class SmartHomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Home Automation',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: LoginScreen(), // Set LoginScreen as the starting point
    );
  }
}
