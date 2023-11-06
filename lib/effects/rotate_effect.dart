// Copyright 2023 Conezi. All rights reserved.

import 'package:animated_item/effects/base_scroll_effect.dart';
import 'package:flutter/material.dart';

import '../res/enums.dart';

class RotateEffect extends ScrollEffect {
  /// Adjust rotation angle as needed
  final double rotationAngle;

  /// Snap back to original angle when not scrolling
  /// Only effective on the [AnimatedItem]
  final bool snap;

  /// Animation type
  final AnimationType type;

  /// The alignment of the origin, relative to the size of the child.
  final AlignmentGeometry alignment;
  const RotateEffect(
      {this.rotationAngle = 10,
      this.snap = true,
      this.type = AnimationType.start,
      this.alignment = Alignment.center})
      : assert(rotationAngle >= 0.0);

  @override
  Widget buildEffect(
      {required Widget child,
      required int index,
      required double position,
      double? itemWidth,
      double? itemHeight,
      bool? isScrolling,
      required AnimationScrollDirection direction}) {
    double delta = index - position;
    if (isStatic(delta, type, direction, snap, isScrolling)) {
      return child;
    }
    delta = delta.abs();
    double rotationAngle = (0.0 - delta) * this.rotationAngle;
    return Transform.rotate(
      angle: delta <= 1 ? rotationAngle : 0,
      alignment: alignment,
      child: child,
    );
  }
}
