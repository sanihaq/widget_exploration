import 'dart:math';

import 'package:flutter/material.dart';

class ColorNotifier extends ValueNotifier<Color?> {
  ColorNotifier([Color? color]) : super(color);

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
