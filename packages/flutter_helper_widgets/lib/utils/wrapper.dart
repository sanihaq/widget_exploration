import 'package:flutter/widgets.dart';

abstract class Wrapper {
  const Wrapper({this.notifiers});
  final List<ValueNotifier>? notifiers;

  Widget wrap({
    required Widget child,
  });
}
