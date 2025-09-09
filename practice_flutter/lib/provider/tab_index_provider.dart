import 'package:flutter/material.dart';

class TabIndexProvider with ChangeNotifier {
  int _tabIndex = 0;
  int get tabIndex => _tabIndex;

  void setTab(int index, BuildContext context) {
    _tabIndex = index;
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