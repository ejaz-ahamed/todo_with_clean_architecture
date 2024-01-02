import 'dart:ui';

import 'package:flutter/material.dart';

final class TodoSpaceExtension extends ThemeExtension<TodoSpaceExtension> {
  final double space_25;
  final double space_50;
  final double space_75;
  final double space_100;
  final double space_125;
  final double space_150;
  final double space_200;
  final double space_250;
  final double space_300;

  TodoSpaceExtension({
    required this.space_25,
    required this.space_50,
    required this.space_75,
    required this.space_100,
    required this.space_125,
    required this.space_150,
    required this.space_200,
    required this.space_250,
    required this.space_300,
  });

  @override
  ThemeExtension<TodoSpaceExtension> copyWith({
    double? space_25,
    double? space_50,
    double? space_75,
    double? space_100,
    double? space_125,
    double? space_150,
    double? space_200,
    double? space_250,
    double? space_300,
  }) {
    return TodoSpaceExtension(
      space_25: space_25 ?? this.space_25,
      space_50: space_50 ?? this.space_50,
      space_75: space_75 ?? this.space_75,
      space_100: space_100 ?? this.space_100,
      space_125: space_125 ?? this.space_125,
      space_150: space_150 ?? this.space_150,
      space_200: space_200 ?? this.space_200,
      space_250: space_250 ?? this.space_250,
      space_300: space_300 ?? this.space_300,
    );
  }

  @override
  ThemeExtension<TodoSpaceExtension> lerp(
      covariant ThemeExtension<TodoSpaceExtension>? other, double t) {
    if (other is! TodoSpaceExtension) {
      return this;
    }

    return TodoSpaceExtension(
      space_25: lerpDouble(space_25, other.space_25, t)!,
      space_50: lerpDouble(space_50, other.space_50, t)!,
      space_75: lerpDouble(space_75, other.space_75, t)!,
      space_100: lerpDouble(space_100, other.space_100, t)!,
      space_125: lerpDouble(space_125, other.space_125, t)!,
      space_150: lerpDouble(space_150, other.space_150, t)!,
      space_200: lerpDouble(space_200, other.space_200, t)!,
      space_250: lerpDouble(space_250, other.space_250, t)!,
      space_300: lerpDouble(space_300, other.space_300, t)!,
    );
  }

  TodoSpaceExtension.fromBaseSpace(double baseSpace)
      : space_25 = baseSpace * 0.25,
        space_50 = baseSpace * 0.5,
        space_75 = baseSpace * 0.75,
        space_100 = baseSpace,
        space_125 = baseSpace * 1.25,
        space_150 = baseSpace * 1.5,
        space_200 = baseSpace * 2,
        space_250 = baseSpace * 2.5,
        space_300 = baseSpace * 3;
}
