import 'package:flutter/material.dart';
import 'base_styles.dart';

/*
|--------------------------------------------------------------------------
| Light Theme Colors
|--------------------------------------------------------------------------
*/

class LightThemeColors implements BaseColorStyles {
  // general
  Color get background => const Color(0xFFFFFFFF);

  Color get primaryContent => const Color(0xFF000000);
  Color get primaryAccent => const Color(0xFF87c694);

  Color get surfaceBackground => Colors.white;
  Color get surfaceContent => Colors.black;

  // app bar
  Color get appBarBackground => Color(0xFF5D69B3);
  Color get appBarPrimaryContent => Colors.white;

  // buttons
  Color get buttonBackground => Color(0xFF5D69B3);
  Color get buttonPrimaryContent => Colors.white;

  // bottom tab bar
  Color get bottomTabBarBackground => Colors.white;

  // bottom tab bar - icons
  Color get bottomTabBarIconSelected => Colors.black54;
  Color get bottomTabBarIconUnselected => Colors.grey.withOpacity(0.5);

  // bottom tab bar - label
  Color get bottomTabBarLabelUnselected => Colors.black45;
  Color get bottomTabBarLabelSelected => Colors.black;
}
