import 'package:dashboard_databank_more/pages/databank_page.dart';
import 'package:dashboard_databank_more/pages/home_page.dart';
import 'package:dashboard_databank_more/pages/more_page.dart';
import 'package:dashboard_databank_more/provider/navigator_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  final List<Widget> _pages = const [HomePage(), DataBankPage(), MorePage()];

  @override
  Widget build(BuildContext context) {
    final navProvider = context.watch<NavigatorProvider>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[navProvider.selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navProvider.selectedPage,
        onTap: (index) {
          context.read<NavigatorProvider>().navigateBottomBar(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/menu.png', width: 24, height: 24),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/databank.png',
              width: 24,
              height: 24,
            ),
            label: 'DataBank',
          ),

          BottomNavigationBarItem(
            icon: Image.asset('assets/images/more.png', width: 24, height: 24),
            label: 'More',
          ),
        ],
      ),
    );
  }
}
