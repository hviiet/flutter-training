import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/page/aqiscale/aqiscale.dart';
import 'package:weather_app/page/locationdetails/locationdetails.dart';
import 'package:weather_app/page/onboarding.dart';
import 'providers/tab_provider.dart';
import 'providers/ui_overlay_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TabProvider()),
        ChangeNotifierProvider(create: (_) => UiOverlayProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LocationDetails(),
    );
  }
}
