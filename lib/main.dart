import 'package:dashboard_databank_more/pages/databank_page.dart';
import 'package:dashboard_databank_more/pages/first_page.dart';
import 'package:dashboard_databank_more/pages/home_page.dart';
import 'package:dashboard_databank_more/pages/more_page.dart';
import 'package:dashboard_databank_more/provider/navigator_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => NavigatorProvider(),
      child: const AQIApp(),
    ),
  );
}

class AQIApp extends StatelessWidget {
  const AQIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
      routes: {
        '/firstpage': (context) => FirstPage(),
        '/homepage': (context) => HomePage(),
        '/databankpage': (context) => DataBankPage(),
        '/morepage': (context) => MorePage(),
      },
    );
  }
}
