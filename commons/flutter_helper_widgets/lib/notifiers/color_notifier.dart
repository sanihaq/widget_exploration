import 'dart:math';

import 'package:flutter/material.dart';

class ColorNotifier extends ValueNotifier<Color?> {
  ColorNotifier._() : super(null);
  static final ColorNotifier _shared = ColorNotifier._();
  factory ColorNotifier.singleton() => _shared;

  factory ColorNotifier() => ColorNotifier._();

  changeColor(Color? color) {
    value = color;
  }

  pickRandom({bool includeAccents = false}) {
    final colors = [
      ...Colors.primaries,
      if (includeAccents) ...Colors.accents,
    ];

    changeColor(colors[Random().nextInt(colors.length)]);
  }
}
