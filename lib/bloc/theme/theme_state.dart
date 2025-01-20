import 'package:flutter/material.dart' show ThemeData;

abstract class ThemeState {
  final ThemeData themeData;

  ThemeState(this.themeData);
}

class ThemeInitialState extends ThemeState {
  ThemeInitialState() : super(ThemeData.light());
}

class LightThemeState extends ThemeState {
  LightThemeState() : super(ThemeData.light());
}

class DarkThemeState extends ThemeState {
  DarkThemeState() : super(ThemeData.dark());
}
