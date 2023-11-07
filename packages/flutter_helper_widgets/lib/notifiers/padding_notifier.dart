import 'package:flutter/material.dart';
import 'package:flutter_helper_widgets/utils/utils.dart';

class PaddingNotifier extends ValueNotifier<EdgeInsets?> {
  PaddingNotifier._() : super(EdgeInsets.zero);
  static final PaddingNotifier _shared = PaddingNotifier._();
  factory PaddingNotifier.singleton() => _shared;

  factory PaddingNotifier() => PaddingNotifier._();

  double _left = 0;
  double _top = 0;
  double _right = 0;
  double _bottom = 0;

  setToNull() {
    value = null;
  }

  setAll(double padding) {
    _left = padding;
    _top = padding;
    _right = padding;
    _bottom = padding;
    value = EdgeInsets.all(padding);
  }

  setHorizontal(
    double padding, {
    bool onlyHorizontal = true,
    bool preferMax = true,
  }) {
    _left = padding;
    _right = padding;
    value = EdgeInsets.symmetric(
      horizontal: padding,
      vertical: onlyHorizontal
          ? 0
          : preferMax
              ? getMaxOrEqual(_top, _bottom)
              : getMinOrEqual(_top, _bottom),
    );
  }

  setVertical(
    double padding, {
    bool onlyVertical = true,
    bool preferMax = true,
  }) {
    _top = padding;
    _bottom = padding;
    value = EdgeInsets.symmetric(
      vertical: padding,
      horizontal: onlyVertical
          ? 0
          : preferMax
              ? getMaxOrEqual(_top, _bottom)
              : getMinOrEqual(_top, _bottom),
    );
  }

  setLeft(double padding, {bool onlyLeft = true}) {
    _left = padding;
    value = EdgeInsets.only(
      left: padding,
      top: onlyLeft ? 0 : _top,
      right: onlyLeft ? 0 : _right,
      bottom: onlyLeft ? 0 : _bottom,
    );
  }

  setTop(double padding, {bool onlyTop = true}) {
    _left = padding;
    value = EdgeInsets.only(
      left: onlyTop ? 0 : _left,
      top: padding,
      right: onlyTop ? 0 : _right,
      bottom: onlyTop ? 0 : _bottom,
    );
  }

  setRight(double padding, {bool onlyRight = true}) {
    _left = padding;
    value = EdgeInsets.only(
      left: onlyRight ? 0 : _left,
      top: onlyRight ? 0 : _top,
      right: padding,
      bottom: onlyRight ? 0 : _bottom,
    );
  }

  setBottom(double padding, {bool onlyBottom = true}) {
    _left = padding;
    value = EdgeInsets.only(
      left: onlyBottom ? 0 : _left,
      top: onlyBottom ? 0 : _top,
      right: onlyBottom ? 0 : _right,
      bottom: padding,
    );
  }

  randomAll({double min = 0, double max = 0}) {
    final value = getRandomDouble(max, min);
    setAll(value > max ? max : value);
  }

  randomHorizontal({
    double max = 0,
    bool onlyHorizontal = true,
    bool preferMax = true,
  }) {
    final value = getRandomDouble(max);
    setHorizontal(
      value > max ? max : value,
      onlyHorizontal: onlyHorizontal,
      preferMax: preferMax,
    );
  }

  randomVertical({
    double max = 0,
    bool onlyVertical = true,
    bool preferMax = true,
  }) {
    final value = getRandomDouble(max);
    setVertical(
      value > max ? max : value,
      onlyVertical: onlyVertical,
      preferMax: preferMax,
    );
  }

  randomLeft({
    double max = 0,
    bool onlyLeft = true,
  }) {
    final value = getRandomDouble(max);
    setLeft(
      value > max ? max : value,
      onlyLeft: onlyLeft,
    );
  }

  randomTop({
    double max = 0,
    bool onlyTop = true,
  }) {
    final value = getRandomDouble(max);
    setTop(
      value > max ? max : value,
      onlyTop: onlyTop,
    );
  }

  randomRight({
    double max = 0,
    bool onlyRight = true,
  }) {
    final value = getRandomDouble(max);
    setRight(
      value > max ? max : value,
      onlyRight: onlyRight,
    );
  }

  randomBottom({
    double max = 0,
    bool onlyBottom = true,
  }) {
    final value = getRandomDouble(max);
    setBottom(
      value > max ? max : value,
      onlyBottom: onlyBottom,
    );
  }
}
