import 'package:animated_item/effects/base_scroll_effect.dart';
import 'package:flutter/material.dart';

class RotateEffect extends ScrollEffect {
  /// Adjust rotation angle as needed
  final double rotationAngle;

  /// Snap back to original angle when not scrolling
  /// Only effective on the [AnimatedItem]
  final bool snap;
  const RotateEffect({this.rotationAngle = 10, this.snap = true})
      : assert(rotationAngle >= 0.0);

  @override
  Widget buildEffect(
      {required Widget child,
      required int index,
      required double position,
      double? itemWidth,
      double? itemHeight,
      bool? isScrolling}) {
    double delta = (index - position).abs();
    double rotationAngle = (0.0 - delta) * this.rotationAngle;
    if (snap && isScrolling == false) {
      return child;
    }
    return Transform.rotate(
      angle: delta <= 1 ? rotationAngle : 0,
      child: child,
    );
  }
}
