import 'package:flutter/material.dart';

class BottomNavModel extends ChangeNotifier {
  int selectedIndex = 0;

  void toggleSelectedIndex(int value) {
    selectedIndex = value;
    notifyListeners();
  }
}
