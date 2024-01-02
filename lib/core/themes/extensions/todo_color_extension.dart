import 'package:flutter/material.dart';

class TodoColorExtension extends ThemeExtension<TodoColorExtension> {
  final Color primary;
  final Color secondary;
  final Color text;

  TodoColorExtension(
      {required this.primary, required this.secondary, required this.text});

  @override
  ThemeExtension<TodoColorExtension> copyWith(
      {Color? primary, Color? secondary, Color? text}) {
    return TodoColorExtension(
        primary: primary ?? this.primary,
        secondary: secondary ?? this.secondary,
        text: text ?? this.text);
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
        text: Color.lerp(text, other.text, t)!);
  }
}
