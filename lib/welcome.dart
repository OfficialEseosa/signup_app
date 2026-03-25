import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  final String fullName;

  const WelcomeScreen({super.key, required this.fullName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cash Money"),
      ),
      body: Center(
        child: Text(
          'Welcome $fullName',
          style: TextStyle(fontSize: 32),
        ),
      ),
    );
  }
}