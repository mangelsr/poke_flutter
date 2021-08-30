import 'package:flutter/material.dart';

class NavigationProvider with ChangeNotifier {
  int selectedTab = 0;

  NavigationProvider();

  changeTab(int newIndex) {
    selectedTab = newIndex;
    notifyListeners();
  }
}
