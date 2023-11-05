import 'package:animated_item/effects/base_scroll_effect.dart';
import 'package:flutter/material.dart';

class ScaleEffect extends ScrollEffect {
  const ScaleEffect();

  @override
  Widget buildEffect({required Widget child, required int index, required double position}) {
    double delta = (index - position).abs();
    double verticalScale = 1.0 - delta * 0.2;
    double horizontalScale = 1.0 - delta * 0.1;
    return Transform(
      transform: Matrix4.identity()..scale(horizontalScale, verticalScale),
      alignment: Alignment.centerLeft,
      child: child,
    );
  }

}
