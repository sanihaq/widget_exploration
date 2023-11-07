import 'package:flutter/material.dart';
import 'package:flutter_helper_widgets/notifiers/color_notifier.dart';
import 'package:flutter_helper_widgets/utils/wrapper.dart';

class WrappingContainer extends StatefulWidget {
  WrappingContainer({
    super.key,
    required this.child,
    this.wrap = true,
    List<ValueNotifier>? notifiers,
  }) : _notifiers = notifiers ?? [ColorNotifier.singleton()];

  final Widget child;
  final bool wrap;
  final List<ValueNotifier> _notifiers;

  @override
  State<WrappingContainer> createState() => _WrappingContainerState();
}

class _WrappingContainerState extends State<WrappingContainer> {
  Color? _color;
  EdgeInsets? _padding;
  @override
  Widget build(BuildContext context) {
    return widget.wrap
        ? widget._notifiers.fold(
            widget.child,
            (child, notifier) => ValueListenableBuilder(
              valueListenable: notifier,
              builder: (context, value, child) {
                if (value is Color?) _color = value;
                if (value is EdgeInsets?) _padding = value;
                return Container(
                  color: _color,
                  padding: _padding,
                  child: child,
                );
              },
              child: child,
            ),
          )
        : widget.child;
  }
}

class ContainerWrapper extends Wrapper {
  const ContainerWrapper({super.key, super.notifiers});

  @override
  Widget wrap({required Widget child, List<ValueNotifier>? notifiers}) {
    return WrappingContainer(
      key: super.key,
      notifiers: super.notifiers,
      child: child,
    );
  }
}
