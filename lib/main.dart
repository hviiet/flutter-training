import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/bloc/aqi_scale/aqi_scale_bloc.dart';
import 'package:flutter_training/bloc/home/home_bloc.dart';
import 'package:flutter_training/bloc/location_detail/location_detail_bloc.dart';
import 'package:flutter_training/providers/auth_provider.dart';
import 'package:flutter_training/providers/navigation_provider.dart';
import 'package:flutter_training/screens/main_screen.dart';
import 'package:flutter_training/services/aqi_service.dart';
import 'package:flutter_training/services/weather_service.dart';
import 'package:provider/provider.dart';
import 'screens/onboarding_screen.dart';

void main() {

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => NavigationProvider()
        ),

        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),

        BlocProvider(
          create: (context) => LocationDetailBloc(
            weatherService: WeatherService(),
            aqiService: AqiService(),
          ),
        ),

        BlocProvider(
          create: (context) => HomeBloc(
            weatherService: WeatherService(),
            aqiService: AqiService(),
          ),
        ), 

        BlocProvider(
            create: (context) => AqiScaleBloc(
              weatherService: WeatherService(),
              aqiService: AqiService(),
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
      scrollBehavior: const AppScrollBehavior(),
      theme: ThemeData(
        fontFamily: 'Arial',
        useMaterial3: true,

        scaffoldBackgroundColor: const Color.fromRGBO(249, 250, 251, 1),

        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,            
          selectedItemColor: Color.fromRGBO(14, 142, 255, 1),  
          unselectedItemColor: Color.fromRGBO(156, 163, 175, 1),   
          elevation: 8,                             
          type: BottomNavigationBarType.fixed,
        ),

      ),

      home: FutureBuilder(
        future: context.read<AuthProvider>().checkAuth(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if(snapshot.hasError) {
            return const Scaffold(
              body: Center(
                child: Text('An error occurred. Please try again later.'),
              ),
            );
          } else if (snapshot.hasData && snapshot.data == true) {
            return const MainScreen();
          } else {
            return const OnboardingScreen();
          }
        },
      ),
    );
  }
}

//  không có hiệu ứng overscroll nữa
class AppScrollBehavior extends MaterialScrollBehavior {
  const AppScrollBehavior();

  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return child;
  }

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const ClampingScrollPhysics();
  }
}