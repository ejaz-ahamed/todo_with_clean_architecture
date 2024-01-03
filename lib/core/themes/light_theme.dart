import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app_clean_arch/core/themes/extensions/todo_color_extension.dart';
import 'package:todo_app_clean_arch/core/themes/extensions/todo_space_extension.dart';

part 'light_theme.g.dart';

final _lightTheme = ThemeData(
  brightness: Brightness.light,
  extensions: [
    TodoColorExtension(
      primary: Colors.deepPurple,
      secondary: Colors.black,
      text: Colors.blueGrey,
      mainColor: Colors.blueAccent,
    ),
    TodoSpaceExtension.fromBaseSpace(8),
  ],
);

@riverpod
ThemeData lightTheme(LightThemeRef ref) {
  return _lightTheme;
}
