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
  @override
  Widget build(BuildContext context) {
    return widget.wrap
        ? widget._notifiers.fold(
            widget.child,
            (child, notifier) => ValueListenableBuilder(
              valueListenable: notifier,
              builder: (context, value, _) {
                if (value is Color?) _color = value;
                return Container(
                  color: _color,
                  child: child,
                );
              },
            ),
          )
        : widget.child;
  }
}

class ContainerWrapper extends Wrapper {
  const ContainerWrapper({super.notifiers});

  @override
  Widget wrap({required Widget child, List<ValueNotifier>? notifiers}) {
    return WrappingContainer(notifiers: super.notifiers, child: child);
  }
}
