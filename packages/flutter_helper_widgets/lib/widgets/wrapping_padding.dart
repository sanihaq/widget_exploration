// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_helper_widgets/notifiers/padding_notifier.dart';
import 'package:flutter_helper_widgets/utils/wrapper.dart';

class WrappingPadding extends StatefulWidget {
  WrappingPadding({
    super.key,
    required this.child,
    this.wrap = true,
    PaddingNotifier? paddingNotifier,
  })  : assert(paddingNotifier == null || !paddingNotifier.isNullable),
        paddingNotifier =
            paddingNotifier ?? PaddingNotifier(EdgeInsets.zero, false);

  final Widget child;
  final bool wrap;
  final PaddingNotifier paddingNotifier;

  @override
  State<WrappingPadding> createState() => _WrappingPaddingState();
}

class _WrappingPaddingState extends State<WrappingPadding> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.paddingNotifier,
      builder: (context, padding, child) {
        return Padding(
          padding: padding!,
          child: child,
        );
      },
      child: widget.child,
    );
  }
}

class PaddingWrapper extends Wrapper {
  const PaddingWrapper({
    super.key,
    this.padding,
  });

  final PaddingNotifier? padding;

  @override
  Widget wrap({required Widget child, List<ValueNotifier>? notifiers}) {
    return WrappingPadding(
      key: super.key,
      child: child,
    );
  }
}
