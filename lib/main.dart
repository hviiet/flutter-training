import 'package:air_quality/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:air_quality/providers/navigation_provider.dart';
import 'package:air_quality/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NavigationProvider(),
      child: MaterialApp(
        title: 'Air Quality App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: const Color(0xFFF5F5F5),
          fontFamily: 'SF-Pro-Display',
        ),
        debugShowCheckedModeBanner: false,
        home: const LoginScreen(),
      ),
    );
  }
}