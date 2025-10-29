import 'package:air_quality/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/login_screen.dart'; // Đổi home thành LoginScreen
import 'services/auth_service.dart'; // Import AuthService
import 'services/storage_service.dart'; // Import StorageService
import 'services/weather_api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => ApiService()),
        RepositoryProvider(create: (context) => StorageService()),
        RepositoryProvider(create: (context) => WeatherApiService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Air Quality App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const OnboardingScreen(),
      ),
    );
  }
}