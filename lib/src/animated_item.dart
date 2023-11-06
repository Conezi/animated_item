// Copyright 2023 Conezi. All rights reserved.

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../effects/base_scroll_effect.dart';
import '../effects/scale_effect.dart';
import '../res/enums.dart';

class AnimatedItem extends StatefulWidget {
  /// Scroll controller
  final ScrollController controller;

  /// Index of the item
  final int index;

  /// List-view item widget
  final Widget child;

  /// Animated item scroll effect
  final ScrollEffect effect;

  /// Use this to build your ListView items and apply [effect]
  const AnimatedItem(
      {required this.controller,
      required this.index,
      required this.child,
      this.effect = const ScaleEffect(),
      super.key});

  @override
  State<AnimatedItem> createState() => _AnimatedItemState();
}

class _AnimatedItemState extends State<AnimatedItem> {
  final GlobalKey _itemKey = GlobalKey();
  double _itemWidth = 0;
  double _itemHeight = 0;
  double _itemPosition = 0.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getItemSize();
    });
    widget.controller.addListener(_listener);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_listener);
    super.dispose();
  }

  void _getItemSize() {
    if (_itemKey.currentContext != null) {
      RenderBox renderBox =
          _itemKey.currentContext!.findRenderObject() as RenderBox;
      _itemWidth = renderBox.size.width;
      _itemHeight = renderBox.size.height;
    }
  }

  void _listener() {
    if (mounted) {
      final itemExtent = widget.controller.position.axis == Axis.horizontal
          ? _itemWidth
          : _itemHeight;
      _itemPosition =
          num.parse((widget.controller.offset / itemExtent).toStringAsFixed(4))
              as double;
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
      key: _itemKey,
      animation: widget.controller,
      builder: (context, _) => widget.effect.buildEffect(
          child: widget.child,
          index: widget.index,
          position: _itemPosition,
          itemWidth: _itemWidth,
          itemHeight: _itemHeight,
          isScrolling: widget.controller.position.isScrollingNotifier.value,
          direction: _scrollDirection),
    );
  }
}
