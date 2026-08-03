import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w2/providers/navigation_provider.dart';

class AppBottomNavigation extends StatelessWidget {
  const AppBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (context, navigationProvider, child){
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0x14000000),
                blurRadius: 12,
                offset: Offset(0, -3)
              ),
            ],
          ),
          child: SafeArea(
            top: false,
            child: BottomNavigationBar(
              currentIndex:navigationProvider.currentIndex ,
              onTap: navigationProvider.changeTab,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              selectedItemColor: const Color(0xff1685ff),
              unselectedItemColor: const Color(0xff6f7785),
              selectedFontSize: 11,
              unselectedFontSize: 11,
              elevation: 0,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard_rounded),
                  label: 'Home', 
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.download_rounded),
                  label: 'Data Bank', 
                ),  
                BottomNavigationBarItem(
                  icon: Icon(Icons.more_horiz_rounded),
                  label:'More', 
                ),

              ],

            ),
            ),
        );
      },
      );
  }
}