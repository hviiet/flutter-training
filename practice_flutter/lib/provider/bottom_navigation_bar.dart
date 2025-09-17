import 'package:flutter/material.dart';


class BottomTabScaffold extends StatefulWidget {
  final List<Widget> pages;
  final int initialIndex;

  const BottomTabScaffold({
    super.key,
    required this.pages,
    this.initialIndex = 0,
  }) : assert(pages.length == 3);

  @override
  State<BottomTabScaffold> createState() => _BottomTabScaffoldState();
}

class _BottomTabScaffoldState extends State<BottomTabScaffold> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  void _onTap(int i) {
    if (_currentIndex == i) return;
    setState(() => _currentIndex = i);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Giữ state từng tab
      body: IndexedStack(index: _currentIndex, children: widget.pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.apps), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_outlined),
            label: 'Data Bank',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
        ],
      ),
    );
  }
}
