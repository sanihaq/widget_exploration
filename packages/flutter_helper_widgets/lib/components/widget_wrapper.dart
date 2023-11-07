import 'package:flutter/material.dart';
import 'package:flutter_helper_widgets/utils/wrapper.dart';

class WidgetWrapper extends StatelessWidget {
  const WidgetWrapper({
    super.key,
    required this.child,
    required this.wrappers,
    this.reverse = true,
  });
  final Widget child;
  final List<Wrapper> wrappers;
  final bool reverse;

  @override
  Widget build(BuildContext context) {
    return (reverse ? wrappers.reversed : wrappers).fold(
      child,
      (child, wrapper) => wrapper.wrap(child: child),
    );
  }
}
