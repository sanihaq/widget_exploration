import 'package:flutter/material.dart';
import 'package:flutter_helper_widgets/flutter_helper_widgets.dart';
import 'package:flutter_helper_widgets/utils/wrapper.dart';

class WrappingContainer extends StatefulWidget {
  WrappingContainer({
    super.key,
    required this.child,
    this.wrap = true,
    ColorNotifier? colorNotifier,
    PaddingNotifier? paddingNotifier,
    this.autoDisposeNotifiers = true,
  })  : colorNotifier = colorNotifier ?? ColorNotifier(),
        paddingNotifier = paddingNotifier ?? PaddingNotifier();

  final Widget child;
  final bool wrap;
  final ColorNotifier colorNotifier;
  final PaddingNotifier paddingNotifier;
  final bool autoDisposeNotifiers;

  @override
  State<WrappingContainer> createState() => _WrappingContainerState();
}

class _WrappingContainerState extends State<WrappingContainer> {
  @override
  void dispose() {
    if (widget.autoDisposeNotifiers) {
      widget.colorNotifier.dispose();
      widget.paddingNotifier.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.wrap) {
      return widget.child;
    }

    return ValueListenableBuilder(
      valueListenable: widget.paddingNotifier,
      builder: (_, padding, child) {
        return ValueListenableBuilder(
          valueListenable: widget.colorNotifier,
          builder: (_, color, child) {
            return Container(
              padding: padding,
              color: color,
              child: child,
            );
          },
          child: child,
        );
      },
      child: widget.child,
    );
  }
}

class ContainerWrapper extends Wrapper {
  const ContainerWrapper({
    Key? key,
    this.colorNotifier,
    this.paddingNotifier,
  }) : super(key: key);

  final ColorNotifier? colorNotifier;

  final PaddingNotifier? paddingNotifier;

  @override
  Widget wrap({required Widget child, List<ValueNotifier>? notifiers}) {
    return WrappingContainer(
      key: key,
      colorNotifier: colorNotifier,
      paddingNotifier: paddingNotifier,
      child: child,
    );
  }
}
