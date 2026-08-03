import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/navigation_provider.dart';
import '../widgets/app_bottom_navigation.dart';
import 'data_bank_screen.dart';
import 'home_screen.dart';
import 'more_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currenIndex = context.watch<NavigationProvider>().currentIndex;
    return Scaffold(
      body: IndexedStack(
        index: currenIndex,
        children: const [
          HomeScreen(),
          DataBankScreen(),
          MoreScreen(),
        ],
      ),
      bottomNavigationBar: const AppBottomNavigation(),
    );
  }
}