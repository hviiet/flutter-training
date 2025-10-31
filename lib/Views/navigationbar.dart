import 'package:flutter/material.dart';
import 'home.dart';
import 'databank.dart';
import 'morepage.dart';

class NavigationBarPage extends StatefulWidget {
  const NavigationBarPage({super.key});

  @override
  State<NavigationBarPage> createState() => _NavigationBarPageState();
}

class _NavigationBarPageState extends State<NavigationBarPage> {
  int _currentIndex = 0;

  // Danh sách các trang
  final List<Widget> _pages = const [
    HomePage(),
    DataBankPage(),
    MorePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // Hiển thị trang theo index
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Đổi trang khi click
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            label: "Data Bank",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.data_usage),
            label: "Data Bank",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: "More",
          ),
        ],
      ),
    );
  }
}
