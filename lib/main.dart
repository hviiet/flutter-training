import 'package:flutter/material.dart';
import 'package:flutter_training/views/onboarding_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_training/provider/tab_provider.dart';
import 'package:flutter_training/provider/blur_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TabProvider()),
        ChangeNotifierProvider(create: (_) => BlurProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const OnboardingPage(),
      ),
    );
  }
}