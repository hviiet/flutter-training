import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'data_bank_screen.dart';
import 'more_screen.dart';

import '../widgets/common/app_bottom_nav_bar.dart';
import '../providers/navigation_provider.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  static final List<Widget> _screens = [
    const HomeScreen(),
    const DataBankScreen(),
    const MoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (context, navigationProvider, child) {
        return Scaffold(
          body: IndexedStack(
            index: navigationProvider.currentIndex,
            children: _screens,
          ),
          
          bottomNavigationBar: const AppBottomNavBar(),
        );
      },
    );
  }
}