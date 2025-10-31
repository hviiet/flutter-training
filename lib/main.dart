import 'package:demo_flutter/views/location_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'API/weather_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => WeatherApiService(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Air Quality App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LocationDetailsScreen(),
      ),
    );
  }
}