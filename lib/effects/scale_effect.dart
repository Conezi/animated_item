import 'package:animated_item/effects/base_scroll_effect.dart';
import 'package:flutter/material.dart';

class ScaleEffect extends ScrollEffect {
  final double verticalScale;
  final double horizontalScale;
  final AlignmentGeometry alignment;
  const ScaleEffect(
      {this.verticalScale = 0.2,
      this.horizontalScale = 0.2,
      this.alignment = Alignment.center})
      : assert(verticalScale >= 0.0),
        assert(horizontalScale >= 0.0);

  @override
  Widget buildEffect(
      {required Widget child, required int index, required double position}) {
    double delta = (index - position).abs();
    double verticalScale = 1.0 - delta * this.verticalScale;
    double horizontalScale = 1.0 - delta * this.horizontalScale;
    return Transform(
      transform: Matrix4.identity()..scale(horizontalScale, verticalScale),
      alignment: alignment,
      child: child,
    );
  }
}
