import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/onboard/onboard.dart';
import 'package:flutter_application_1/providers/user_provider.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Onboard()
      ),
    );
  }
}