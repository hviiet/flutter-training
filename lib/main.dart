import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/onboard/onboard.dart';
import 'package:flutter_application_1/providers_and_state/user_provider.dart';
import 'package:flutter_application_1/services/weather_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => WeatherBloc()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const Onboard(),
        ),
      ),
    );
  }
}