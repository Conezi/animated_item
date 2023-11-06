import 'package:animated_item/effects/base_scroll_effect.dart';
import 'package:flutter/material.dart';

class TranslateEffect extends ScrollEffect {
  final int start;

  /// Snap back to original position when not scrolling
  /// Only effective on the [AnimatedItem]
  final bool snap;

  /// Animation axis
  final Axis animationAxis;
  const TranslateEffect(
      {this.start = 10,
      this.snap = true,
      this.animationAxis = Axis.horizontal});

  @override
  Widget buildEffect(
      {required Widget child,
      required int index,
      required double position,
      double? itemWidth,
      double? itemHeight,
      bool? isScrolling}) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double delta = (index - position).abs();
        double start = animationAxis == Axis.horizontal
            ? ((itemWidth ?? constraints.maxWidth) * 0.105) * delta * this.start
            : ((itemHeight ?? constraints.maxHeight) * 0.105) *
                delta *
                this.start;
        if (snap && isScrolling == false) {
          return child;
        }
        return Transform.translate(
            offset: (animationAxis == Axis.horizontal
                ? Offset(start, 0)
                : Offset(0, -start)),
            child: child);
      },
    );
  }
}
