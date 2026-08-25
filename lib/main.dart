import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'core/app_dependencies.dart';
import 'cubits/location/location_cubit.dart';
import 'providers/app_flow_provider.dart';
import 'providers/navigation_provider.dart';
import 'screens/auth_gate.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dependencies = AppDependencies.create();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
        ChangeNotifierProvider(create: (_) => AppFlowProvider()),
      ],
      child: BlocProvider(
        create: (_) => LocationCubit(dependencies.locationRepository),
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
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff1685ff)),
        fontFamily: 'Arial',
      ),
      home: const AuthGate(),
    );
  }
}
