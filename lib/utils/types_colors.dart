import 'package:flutter/material.dart';

Map<String, Color> typesColors = {
  'flying': Color(0XFF9E86E4),
  'fire': Color(0XFFE26717),
  'ice': Color(0XFF79E2E8),
  'psychic': Color(0XFFec3f7e),
  'water': Color(0XFF2196F3),
  'grass': Color(0XFF49B150),
  'electric': Color(0XFFFFCB09),
  'fighting': Color(0XFFd32f2e),
  'fairy': Color(0XFFf483bb),
  'ground': Color(0XFFdfb352),
  'rock': Color(0XFFbda539),
  'steel': Color(0XFFb4b5ca),
  'dark': Color(0XFF543930),
  'ghost': Color(0XFF7556a4),
  'dragon': Color(0XFF6837c4),
  'normal': Color(0XFFbfb97f),
  'bug': Color(0XFF99b82e),
  'poison': Color(0XFFaa47bc),
  'shadow': Colors.black,
  'unknown': Colors.black,
};

//  ranges from 0.0 to 1.0
Color darken(Color color, [double amount = .1]) {
  assert(amount >= 0 && amount <= 1);
  final hsl = HSLColor.fromColor(color);
  final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
  return hslDark.toColor();
}

Color lighten(Color color, [double amount = .1]) {
  assert(amount >= 0 && amount <= 1);
  final hsl = HSLColor.fromColor(color);
  final hslLight = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));
  return hslLight.toColor();
}
