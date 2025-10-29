import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:air_quality/blocs/navigation_cubit.dart';
import 'package:air_quality/screens/home_screen.dart';
import 'package:air_quality/screens/data_bank_screen.dart';
import 'package:air_quality/screens/more_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  final List<Widget> _screens = const [
    HomeScreen(),
    DataBankScreen(),
    MoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationCubit(),
      child: BlocBuilder<NavigationCubit, int>(
        builder: (context, currentIndex) {
          return Scaffold(
            body: IndexedStack(
              index: currentIndex,
              children: _screens,
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index) {
                context.read<NavigationCubit>().setIndex(index);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  activeIcon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.cloud_download_outlined),
                  activeIcon: Icon(Icons.cloud_download),
                  label: 'Data Bank',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.more_horiz),
                  activeIcon: Icon(Icons.more_horiz),
                  label: 'More',
                ),
              ],
              selectedItemColor: Colors.blueAccent,
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: true,
            ),
          );
        },
      ),
    );
  }
}