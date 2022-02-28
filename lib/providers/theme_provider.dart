import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData actualTheme = ThemeData(
    primarySwatch: Colors.blue,
  );

  changeTheme(Color color) {
    actualTheme = ThemeData(
      primarySwatch: _genenrateMaterialColor(color),
    );
    notifyListeners();
  }

  MaterialColor _genenrateMaterialColor(Color color) {
    List<double> strengths = [0.05];
    final Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }

    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });

    return MaterialColor(color.value, swatch);
  }
}
