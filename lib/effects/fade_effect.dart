import 'package:animated_item/effects/base_scroll_effect.dart';
import 'package:flutter/material.dart';

class FadeEffect extends ScrollEffect {
  /// Opacity determines how faded the item becomes.
  /// Higher numbers results to more fading.
  final double opacity;
  const FadeEffect(
      {this.opacity = 0.5})
      : assert(opacity >= 0.0);

  @override
  Widget buildEffect(
      {required Widget child, required int index, required double position}) {
    double delta = (index - position).abs();
    double opacity = 1.0 - delta * this.opacity;
    return Opacity(
      opacity: opacity < 0 ? 0 : opacity > 1 ? 1 : opacity,
      child: child,
    );
  }
}
