import 'package:flutter/widgets.dart';

abstract class Wrapper {
  const Wrapper({this.key, this.notifiers});
  final Key? key;
  final List<ValueNotifier>? notifiers;

  Widget wrap({
    required Widget child,
  });
}
