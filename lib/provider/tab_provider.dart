import 'package:flutter/material.dart';

class TabProvider with ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void changeTab(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void setTab(int index, BuildContext context) {
    _currentIndex = index;
    notifyListeners();
    if (index == 0) {
      Navigator.pushReplacementNamed(context, '/home');
    } else if (index == 1) {
      Navigator.pushReplacementNamed(context, '/databank');
    } else if (index == 2) {
      Navigator.pushReplacementNamed(context, '/more');
    }
  }
}