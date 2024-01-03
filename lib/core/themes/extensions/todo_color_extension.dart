import 'package:flutter/material.dart';

class TodoColorExtension extends ThemeExtension<TodoColorExtension> {
  final Color primary;
  final Color secondary;
  final Color text;
  final Color mainColor;

  TodoColorExtension(
      {required this.primary,
      required this.secondary,
      required this.text,
      required this.mainColor});

  @override
  ThemeExtension<TodoColorExtension> copyWith(
      {Color? primary, Color? secondary, Color? text, Color? mainColor}) {
    return TodoColorExtension(
        primary: primary ?? this.primary,
        secondary: secondary ?? this.secondary,
        text: text ?? this.text,
        mainColor: mainColor ?? this.mainColor);
  }

  @override
  ThemeExtension<TodoColorExtension> lerp(
      covariant ThemeExtension<TodoColorExtension>? other, double t) {
    if (other is! TodoColorExtension) {
      return this;
    }
    return TodoColorExtension(
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      text: Color.lerp(text, other.text, t)!,
      mainColor: Color.lerp(mainColor, other.mainColor, t)!,
    );
  }
}
