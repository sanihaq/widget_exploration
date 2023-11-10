import 'package:bottom_navigation_bar/widgets/controller_widget_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_helper_widgets/flutter_helper_widgets.dart';

class WrapContainer extends StatelessWidget {
  static final paddingNotifier = PaddingNotifier();
  static final colorNotifier = ColorNotifier();
  const WrapContainer({super.key, required this.child});
  final BottomNavigationBar child;

  @override
  Widget build(BuildContext context) {
    return WidgetWrapper(
      wrappers: [
        ContainerWrapper(
          paddingNotifier: paddingNotifier,
          colorNotifier: colorNotifier,
        ),
      ],
      child: child,
    );
  }
}

class WrapContainerControllerWidget extends StatelessWidget {
  const WrapContainerControllerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ControllerWidgetTile(
      title: 'Wrapping Container',
      children: [
        Row(
          children: [
            const Text('padding:'),
            TextButton(
              onPressed: () {
                WrapContainer.paddingNotifier.randomAll(min: 19.5, max: 20);
              },
              child: const Text('change padding'),
            ),
            TextButton(
              onPressed: () {
                WrapContainer.paddingNotifier.setToNull();
              },
              child: const Text('change padding to null'),
            ),
          ],
        ),
        Row(
          children: [
            const Text('color:'),
            TextButton(
              onPressed: () {
                WrapContainer.colorNotifier.pickRandom();
              },
              child: const Text('change color'),
            ),
            TextButton(
              onPressed: () {
                WrapContainer.colorNotifier.changeColor(null);
              },
              child: const Text('change color to null'),
            ),
          ],
        ),
      ],
    );
  }
}
