import 'package:flutter/material.dart';

class BlurProvider extends ChangeNotifier {
  bool _blurOn = false;
  bool get blurOn => _blurOn;

  void showBlur() {
    _blurOn = true;
    notifyListeners();
  }

  void hideBlur() {
    _blurOn = false;
    notifyListeners();
  }
}
