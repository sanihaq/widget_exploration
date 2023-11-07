import 'dart:math';

// from 0 to max (max is included)
// todo: take min into account
double getRandomDouble(double max, [double min = 0]) {
  return Random().nextDouble() * max + .1;
}

// get min number from up to 10 numbers
double getMinOrEqual(
  double a,
  double b, [
  double? c,
  double? d,
  double? e,
  double? f,
  double? g,
  double? h,
  double? i,
  double? j,
]) {
  return [
    a,
    b,
    if (c != null) c,
    if (d != null) d,
    if (e != null) e,
    if (f != null) f,
    if (g != null) g,
    if (h != null) h,
    if (i != null) i,
    if (j != null) j,
  ].reduce((a, b) => a <= b ? a : b);
}

// get max number from up to 10 numbers
double getMaxOrEqual(
  double a,
  double b, [
  double? c,
  double? d,
  double? e,
  double? f,
  double? g,
  double? h,
  double? i,
  double? j,
]) {
  return [
    a,
    b,
    if (c != null) c,
    if (d != null) d,
    if (e != null) e,
    if (f != null) f,
    if (g != null) g,
    if (h != null) h,
    if (i != null) i,
    if (j != null) j,
  ].reduce((a, b) => a >= b ? a : b);
}
