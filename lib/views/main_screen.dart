import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_training/provider/tab_provider.dart';
import 'package:flutter_training/views/homepage.dart';
import 'package:flutter_training/views/databank_page.dart';
import 'package:flutter_training/views/more.dart';
import 'package:flutter_training/components/navigate_under.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onTabTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    Provider.of<TabProvider>(context, listen: false).changeTab(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: const [
          HomeScreen(),
          DataBankScreen(),
          MoreScreen(),
        ],
      ),
      bottomNavigationBar: Consumer<TabProvider>(
        builder: (context, tabProvider, _) => UnderNavigate(
          currentIndex: tabProvider.currentIndex,
          onTap: _onTabTapped,
        ),
      ),
    );
  }
}
