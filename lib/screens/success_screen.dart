import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  final String fullName;

  const SuccessScreen({super.key, required this.fullName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Success Screen'),
            Text('Welcome, $fullName!'),
          ],
        ),
      ),
    );
  }
}
