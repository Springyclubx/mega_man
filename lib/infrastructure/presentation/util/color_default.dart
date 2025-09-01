import 'package:flutter/material.dart';
import 'package:harry_potter/extension/context.dart';

class ColorDefault {
  ColorDefault({required this.context});

  final BuildContext context;

  Color get backgraundColor =>
      context.isDarkTheme ? backGroundColorDark : backGroundColorLight;

  Color? get cardColor => context.isDarkTheme
      ? cardColorDark.withValues(alpha: 0.9)
      : cardColorLight.withValues(alpha: 0.9);


  Color? get cardColorSelected => context.isDarkTheme
      ? oppositeNewColor2.withValues(alpha: 0.9)
      : newColor2.withValues(alpha: 0.9);

  Color get textColor => context.isDarkTheme ? textColorDark : textColorLight;
  Color get textColorSelected => context.isDarkTheme ? textColorLight :textColorDark ;

  Color get colorTest => context.isDarkTheme ? oppositeNewColor2 : newColor2;

  static Color backGroundColorLight = const Color(0xFFedf6ee);
  static Color backGroundColorDark = const Color(0xFF120911);

  static Color textColorLight = const Color(0xFF151101);
  static Color textColorDark = const Color(0xFFEAEEFE);

  static Color cardColorLight = const Color(0xFFd1c089);
  static Color cardColorDark = const Color(0xFF2e3f76);

  static Color newColor2 = const Color(0xFFb3204d);
  static Color oppositeNewColor2 = const Color(0xFF4cdfb2);
}
