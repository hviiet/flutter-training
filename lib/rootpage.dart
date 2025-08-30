import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/tab_provider.dart';
import 'home.dart';
import 'databank.dart';
import 'more.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  final List<Widget> _pages = const [Home(), DataBank(), More()];

  @override
  Widget build(BuildContext context) {
    final tabProvider = Provider.of<TabProvider>(context);

    return Scaffold(
      body: _pages[tabProvider.currentIndex],

      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: const Color.fromRGBO(17, 24, 39, 0.1),
              offset: const Offset(0, -10),
              blurRadius: 25,
              spreadRadius: -25,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _NavItem(icon: 'assets/images/home.png', label: "Home", index: 0),
            _NavItem(
              icon: 'assets/images/databank.png',
              label: "Data Bank",
              index: 1,
            ),
            _NavItem(icon: 'assets/images/more.png', label: "More", index: 2),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String icon;
  final String label;
  final int index;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final tabProvider = Provider.of<TabProvider>(context);
    final bool active = tabProvider.currentIndex == index;

    return GestureDetector(
      onTap: () => tabProvider.changeTab(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            icon,
            width: 24,
            height: 24,
            color: active
                ? const Color.fromRGBO(36, 93, 216, 1)
                : Colors.black54,
          ),
          Text(
            label,
            style: TextStyle(
              fontFamily: 'ABeeZee',
              fontWeight: FontWeight.w400,
              fontSize: 10,
              height: 12 / 10,
              letterSpacing: -0.5,
              color: active
                  ? const Color.fromRGBO(36, 93, 216, 1)
                  : const Color.fromRGBO(0, 0, 0, 0.72),
            ),
          ),
        ],
      ),
    );
  }
}
