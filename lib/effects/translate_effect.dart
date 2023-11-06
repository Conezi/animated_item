import 'package:animated_item/effects/base_scroll_effect.dart';
import 'package:flutter/material.dart';

class TranslateEffect extends ScrollEffect {
  final Axis animationAxis;
  final int start;
  const TranslateEffect(
      {this.start = 10, this.animationAxis = Axis.horizontal});

  @override
  Widget buildEffect(
      {required Widget child,
      required int index,
      required double position,
      double? itemWidth,
      double? itemHeight}) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        //final size  = MediaQuery.of(context).size;
        double delta = (index - position).abs();
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
