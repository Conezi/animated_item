// Copyright 2023 Conezi. All rights reserved.

import 'package:flutter/material.dart';

import '../res/enums.dart';

abstract class ScrollEffect {
  const ScrollEffect();

  bool shouldAnimate(
      double delta, AnimationType type, AnimationScrollDirection direction) {
    final isForward = direction == AnimationScrollDirection.forward;
    final exiting = delta < 0;
    final onlyIn = isForward ? !exiting : exiting;
    final onlyOut = isForward ? exiting : !exiting;
    final onlyStart = !exiting;
    final onlyEnd = exiting;
    final animate = type == AnimationType.animateIn
        ? onlyIn
        : type == AnimationType.animateOut
            ? onlyOut
            : type == AnimationType.start
                ? onlyStart
                : type == AnimationType.end
                    ? onlyEnd
                    : true;
    return animate;
  }

  Widget buildEffect(
      {required Widget child,
      required int index,
      required double position,
      double? itemWidth,
      double? itemHeight,
      bool? isScrolling,
      required AnimationScrollDirection direction});
}
