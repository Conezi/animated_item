// Copyright 2023 Conezi. All rights reserved.

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../effects/base_scroll_effect.dart';
import '../effects/scale_effect.dart';
import '../res/enums.dart';

class AnimatedPage extends StatefulWidget {
  /// Page controller
  final PageController controller;

  /// Index of the page
  final int index;

  /// Page-view page widget
  final Widget child;

  /// Animated page scroll effect
  final ScrollEffect effect;

  /// Use this to build your PageView pages and apply [effect]
  const AnimatedPage(
      {required this.controller,
      required this.index,
      required this.child,
      this.effect = const ScaleEffect(),
      super.key});

  @override
  State<AnimatedPage> createState() => _AnimatedPageState();
}

class _AnimatedPageState extends State<AnimatedPage> {
  double _pagePosition = 0.0;

  @override
  void initState() {
    super.initState();
    if (widget.controller.position.haveDimensions) {
      widget.controller.addListener(() {
        _listener();
      });
    }
  }

  _listener() {
    if (mounted) {
      setState(() {
        _pagePosition =
            num.parse(widget.controller.page!.toStringAsFixed(4)) as double;
      });
    }
  }

  AnimationScrollDirection get _scrollDirection {
    if (widget.controller.position.userScrollDirection ==
        ScrollDirection.reverse) {
      return AnimationScrollDirection.forward;
    }
    return AnimationScrollDirection.reverse;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: widget.controller,
        builder: (context, _) => widget.effect.buildEffect(
            child: widget.child,
            index: widget.index,
            position: _pagePosition,
            direction: _scrollDirection));
  }
}
