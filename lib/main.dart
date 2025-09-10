import 'package:demo_flutter/models/login.dart';
import 'package:demo_flutter/models/onboarding.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key}); 
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Onboarding(),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}