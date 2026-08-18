import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'cubits/location/location_cubit.dart';
import 'providers/app_flow_provider.dart';
import 'providers/navigation_provider.dart';
import 'repositories/location_repository.dart';
import 'screens/auth_gate.dart';
import 'services/weather_api_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const aqicnToken = String.fromEnvironment(
    'AQICN_TOKEN',
    defaultValue: 'ab5be9511f1cbd53fab19386f44ecb55da92a3d4',
  );
  const weatherApiKey = String.fromEnvironment(
    'WEATHER_API_KEY',
    defaultValue: 'c172a97ff41c4dcead021123261108',
  );

  final dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
    ),
  );

  final repository = LocationRepository(
    apiService: WeatherApiService(
      dio: dio,
      aqicnToken: aqicnToken,
      weatherApiKey: weatherApiKey,
    ),
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
        ChangeNotifierProvider(create: (_) => AppFlowProvider()),
      ],
      child: BlocProvider(
        create: (_) => LocationCubit(repository),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Air Quality',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xfff8f9fb),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff1685ff),
        ),
        fontFamily: 'Arial',
      ),
      home: const AuthGate(),
    );
  }
}
