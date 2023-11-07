// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_helper_widgets/notifiers/padding_notifier.dart';
import 'package:flutter_helper_widgets/utils/wrapper.dart';

class WrappingPadding extends StatefulWidget {
  WrappingPadding({
    super.key,
    required this.child,
    this.wrap = true,
    List<ValueNotifier>? notifiers,
  }) : _notifiers = notifiers ?? [PaddingNotifier.singleton()];

  final Widget child;
  final bool wrap;
  final List<ValueNotifier> _notifiers;

  @override
  State<WrappingPadding> createState() => _WrappingPaddingState();
}

class _WrappingPaddingState extends State<WrappingPadding> {
  EdgeInsets _padding = EdgeInsets.zero;
  @override
  Widget build(BuildContext context) {
    return widget.wrap
        ? widget._notifiers.fold(
            widget.child,
            (child, notifier) => ValueListenableBuilder(
              valueListenable: notifier,
              builder: (context, value, _) {
                if (value is EdgeInsets) _padding = value;
                return Padding(
                  padding: _padding,
                  child: child,
                );
              },
            ),
          )
        : widget.child;
  }
}

class PaddingWrapper extends Wrapper {
  const PaddingWrapper({super.notifiers});

  @override
  Widget wrap({required Widget child, List<ValueNotifier>? notifiers}) {
    return WrappingPadding(notifiers: notifiers, child: child);
  }
}
