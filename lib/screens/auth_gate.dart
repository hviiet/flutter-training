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

    return switch (status) {
      AppFlowStatus.loading => const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        ),
      AppFlowStatus.onboarding => const OnboardingScreen(),
      AppFlowStatus.login => const LoginScreen(),
      AppFlowStatus.authenticated => const MainScreen(),
    };
  }
}
