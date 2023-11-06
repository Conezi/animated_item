// Copyright 2023 Conezi. All rights reserved.

import 'package:animated_item/effects/base_scroll_effect.dart';
import 'package:flutter/material.dart';

import '../res/enums.dart';

class FadeEffect extends ScrollEffect {
  /// Opacity determines how faded the item becomes.
  /// Higher numbers results to more fading.
  final double opacity;

  /// Snap back to original opacity when not scrolling
  /// Only effective on the [AnimatedItem]
  final bool snap;
  final AnimationType type;
  const FadeEffect(
      {this.opacity = 0.5,
      this.snap = true,
      this.type = AnimationType.animateInAndOut})
      : assert(opacity >= 0.0);

  @override
  Widget buildEffect(
      {required Widget child,
      required int index,
      required double position,
      double? itemWidth,
      double? itemHeight,
      bool? isScrolling,
      required AnimationScrollDirection direction}) {
    final shouldSnap = snap && isScrolling == false;
    double delta = index - position;

    if (shouldSnap || !shouldAnimate(delta, type, direction)) {
      return child;
    }
    delta = delta.abs();
    double opacity = 1.0 - delta * this.opacity;
    return Opacity(
      opacity: opacity < 0
          ? 0
          : opacity > 1
              ? 1
              : opacity,
      child: child,
    );
  }
}
