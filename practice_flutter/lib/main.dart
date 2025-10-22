import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'provider/auth_provider.dart';
import 'provider/bottom_navigation_bar.dart';
import 'screens/onboarding.dart';
import 'screens/login.dart';
import 'screens/home.dart';
import 'screens/databank.dart';
import 'screens/more.dart';
import 'screens/location_details.dart';
import 'business_logic/weather_aqi/weather_aqi_bloc.dart';
import 'services/weather_service.dart';
import 'services/air_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()..restoreSession()),
        BlocProvider(
          create: (_) => WeatherAqiBloc(
            weatherService: WeatherService(),
            airService: AirService(),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

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
      routes: {
        '/': (context) => const OnboardingScreen(),
        '/login': (context) => const LoginScreen(),
        '/app': (context) => BottomTabScaffold(
          pages: const [HomeScreen(), DataBankScreen(), MoreScreen()],
        ),
        '/aqi_scale': (context) => const LocationDetails(),
      },
    );
  }
}
