import 'package:animated_item/effects/base_scroll_effect.dart';
import 'package:flutter/material.dart';

class FadeEffect extends ScrollEffect {
  /// Opacity determines how faded the item becomes.
  /// Higher numbers results to more fading.
  final double opacity;

  /// Snap back to original opacity when not scrolling
  /// Only effective on the [AnimatedItem]
  final bool snap;
  const FadeEffect({this.opacity = 0.5, this.snap = true})
      : assert(opacity >= 0.0);

  @override
  Widget buildEffect(
      {required Widget child,
      required int index,
      required double position,
      double? itemWidth,
      double? itemHeight,
      bool? isScrolling}) {
    double delta = (index - position).abs();
    double opacity = 1.0 - delta * this.opacity;
    if (snap && isScrolling == false) {
      return child;
    }
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
