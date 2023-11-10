import 'package:flutter/widgets.dart';

abstract class Wrapper {
  const Wrapper({this.key});
  final Key? key;

  Widget wrap({
    required Widget child,
  });
}
