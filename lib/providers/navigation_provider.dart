import 'package:flutter/material.dart';

class NavigationProvider with ChangeNotifier {
  int _currentIndex = 0; // Index của tab hiện tại, mặc định là 0 (Home)

  // Getter để các widget khác có thể đọc được index hiện tại
  int get currentIndex => _currentIndex;

  // Setter để thay đổi tab
  void setIndex(int index) {
    _currentIndex = index;
    // Thông báo cho tất cả các "listener" (widget đang lắng nghe) rằng trạng thái đã thay đổi
    // để chúng có thể build lại giao diện.
    notifyListeners();
  }
}