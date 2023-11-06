// Copyright 2023 Conezi. All rights reserved.

import 'package:animated_item/effects/base_scroll_effect.dart';
import 'package:flutter/material.dart';

import '../res/enums.dart';

class TranslateEffect extends ScrollEffect {
  final int start;

  /// Snap back to original position when not scrolling
  /// Only effective on the [AnimatedItem]
  final bool snap;

  /// Animation axis
  final Axis animationAxis;
  final AnimationType type;
  const TranslateEffect(
      {this.start = 10,
      this.snap = true,
      this.animationAxis = Axis.horizontal,
      this.type = AnimationType.always});

  @override
  Widget buildEffect(
      {required Widget child,
      required int index,
      required double position,
      double? itemWidth,
      double? itemHeight,
      bool? isScrolling,
      required AnimationScrollDirection direction}) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final shouldSnap = snap && isScrolling == false;
        double delta = index - position;

        if (shouldSnap || !shouldAnimate(delta, type, direction)) {
          return child;
        }
        delta = delta.abs();
        double start = animationAxis == Axis.horizontal
            ? ((itemWidth ?? constraints.maxWidth) * 0.105) * delta * this.start
            : ((itemHeight ?? constraints.maxHeight) * 0.105) *
                delta *
                this.start;
        return Transform.translate(
            offset: (animationAxis == Axis.horizontal
                ? Offset(start, 0)
                : Offset(0, -start)),
            child: child);
      },
    );
  }
}
