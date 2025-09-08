// lib/pages/root_page.dart
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/tab_provider.dart';
import 'providers/ui_overlay_provider.dart';
import 'home.dart';
import 'databank.dart';
import 'more.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  final List<Widget> _pages = const [Home(), DataBank(), More()];

  @override
  Widget build(BuildContext context) {
    final tabProvider = Provider.of<TabProvider>(context);
    final uiOverlayProvider = Provider.of<UiOverlayProvider>(context);

    return Stack(
      children: [
        Scaffold(
          body: _pages[tabProvider.currentIndex],

          // Thanh điều hướng giữa các trang Home, Data Bank và More
          bottomNavigationBar: Container(
            height: 88,
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
              children: const [
                _NavItem(
                  icon: 'assets/images/home/home.png',
                  label: "Home",
                  index: 0,
                ),
                _NavItem(
                  icon: 'assets/images/databank/databank.png',
                  label: "Data Bank",
                  index: 1,
                ),
                _NavItem(
                  icon: 'assets/images/more/more.png',
                  label: "More",
                  index: 2,
                ),
              ],
            ),
          ),
        ),

        if (uiOverlayProvider.blurOn) ...[
          // Lớp blur
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
              child: Container(
                color: const Color.fromRGBO(255, 255, 255, 0.72),
              ),
            ),
          ),

          // Toast
          Positioned(
            left: 20,
            right: 20,
            bottom: 20,
            child: Container(
              height: 54,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(0, 174, 17, 1),
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.16),
                    offset: Offset(0, 4),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: Image.asset(
                      'assets/images/databank/check.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text(
                      'Request Sent!',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: 'ABeeZee',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        height: 1.0,
                        letterSpacing: 0.15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),

                  //CLOSE
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => uiOverlayProvider.hideBlur(),
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: Image.asset(
                        'assets/images/databank/close.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ],
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
