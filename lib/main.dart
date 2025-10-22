import 'package:flutter/material.dart';
import 'package:flutter_training/views/onboarding_page.dart';
import 'package:flutter_training/views/login_page.dart';
import 'package:flutter_training/views/main_screen.dart';
import 'package:flutter_training/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter_training/provider/tab_provider.dart';
import 'package:flutter_training/provider/blur_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/bloc/location_details/location_details_bloc.dart';
import 'package:flutter_training/services/weather.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TabProvider()),
        ChangeNotifierProvider(create: (_) => BlurProvider()),
        BlocProvider(
          create: (_) => LocationDetailsBloc(
            weatherService: WeatherApiService(),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        onGenerateRoute: (settings) {
          // Handle route with arguments
          if (settings.name == '/') {
            final city = settings.arguments as String?;
            return MaterialPageRoute(
              builder: (context) => const AuthChecker(),
              settings: RouteSettings(arguments: city),
            );
          } else if (settings.name == '/main') {
            final city = settings.arguments as String?;
            return MaterialPageRoute(
              builder: (context) => MainScreen(selectedCity: city),
            );
          }
          
          // Default routes
          return MaterialPageRoute(
            builder: (context) {
              switch (settings.name) {
                case '/onboarding':
                  return const OnboardingPage();
                case '/login':
                  return const Login();
                default:
                  return const AuthChecker();
              }
            },
          );
        },
      ),
    );
  }
}

class AuthChecker extends StatefulWidget {
  const AuthChecker({super.key});

  @override
  State<AuthChecker> createState() => _AuthCheckerState();
}

class _AuthCheckerState extends State<AuthChecker> {
  final Auth _auth = Auth();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _checkAuthStatus();
  }

  Future<void> _checkAuthStatus() async {
    try {
      final isLoggedIn = await _auth.isLoggedIn();
      
      if (isLoggedIn) {
        // Kiểm tra token có hết hạn không và refresh nếu cần
        final tokenValid = await _auth.ensureValidToken();
        if (tokenValid) {
          if (mounted) {
            Navigator.pushReplacementNamed(context, '/main');
          }
        } else {
          // Token không thể refresh, logout
          await _auth.logout();
          if (mounted) {
            Navigator.pushReplacementNamed(context, '/onboarding');
          }
        }
      } else {
        if (mounted) {
          Navigator.pushReplacementNamed(context, '/onboarding');
        }
      }
    } catch (e) {
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/onboarding');
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    
    return const OnboardingPage();
  }
}