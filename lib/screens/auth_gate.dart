import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/app_flow_provider.dart';
import 'login_screen.dart';
import 'main_screen.dart';
import 'onboarding_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    final status = context.watch<AppFlowProvider>().status;

    switch (status) {
      case AppFlowStatus.loading:
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );

      case AppFlowStatus.onboarding:
        return const OnboardingScreen();

      case AppFlowStatus.login:
        return const LoginScreen();

      case AppFlowStatus.authenticated:
        return const MainScreen();
    }
  }
}