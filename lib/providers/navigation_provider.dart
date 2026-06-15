import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void updateIndex(int newIndex) {
    if (newIndex == _currentIndex) return;
    
    _currentIndex = newIndex;
    notifyListeners();
  }
}