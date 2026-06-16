import 'package:flutter/material.dart';

class NavigatorProvider extends ChangeNotifier {
  int _selectedPage = 0;

  int get selectedPage => _selectedPage;

  void navigateBottomBar(int index) {
    _selectedPage = index;

    notifyListeners(); // notice to BottomNavigationBar
  }
}
