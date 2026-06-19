import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/city/city_cubit.dart';
import 'package:weather_app/providers/authProvider.dart';
import 'package:weather_app/providers/navigation_provider.dart';
import 'package:weather_app/providers/requestProvider.dart';
import 'package:weather_app/screen/dashboard_page.dart';
import 'package:weather_app/services/air_quality_service.dart';
import 'package:weather_app/services/weather_service.dart';
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
        ChangeNotifierProvider(
          create:(_) => Authprovider(), 
        )
      ], 
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => CityCubit(airService: AirQualityService(), weatherService: WeatherService()) ,
          )
        ], 
        child: MyApp(),
      ),
    )
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: FutureBuilder(
        future: context.read<Authprovider>().checkAuth(), 
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Scaffold(
              body: Center(child: CircularProgressIndicator(),),
            );
          }

          return snapshot.data! ? DashboardPage(): OnboardingScreen();
        }
      ),
    );
  }

}

