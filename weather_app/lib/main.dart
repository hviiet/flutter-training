import 'package:flutter/material.dart';
import 'package:weather_app/providers/navigation_provider.dart';
import 'package:weather_app/providers/requestProvider.dart';
import 'package:weather_app/screen/dashboard_page.dart';
import 'screen/onboarding.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers:[
        ChangeNotifierProvider(
          create: (_) => NavigationProvider(),  
        ),
        ChangeNotifierProvider(
          create: (_) => Requestprovider(),
        ),
      ], 
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: OnboardingScreen(),
    );
  }

}

