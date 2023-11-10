// WrappingContainer can be instantiated with a child widget and optional notifiers
import 'package:flutter/material.dart';
import 'package:flutter_helper_widgets/widgets/wrapping_container.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('WrappingContainer can be instantiated with a child widget', () {
    final child = Container();

    final wrappingContainer = WrappingContainer(
      child: child,
    );

    expect(wrappingContainer.child, equals(child));
  });
}
