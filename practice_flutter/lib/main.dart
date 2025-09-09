import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/tab_index_provider.dart';
import 'screens/onboarding.dart';
import 'screens/login.dart';
import 'screens/home.dart';
import 'screens/databank.dart';
import 'screens/more.dart';

void main() => runApp(
  MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => TabIndexProvider())],
    child: const MyApp(),
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AQI UI',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const OnboardingScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/databank': (context) => const DataBankScreen(),
        '/more': (context) => const MoreScreen(),
      },
    );
  }
}
