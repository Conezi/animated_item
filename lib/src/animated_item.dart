import 'package:animated_item/effects/scale_effect.dart';
import 'package:flutter/material.dart';

import '../effects/base_scroll_effect.dart';

class AnimatedItem extends StatefulWidget {
  final ScrollController controller;
  final int index;
  final Widget child;
  final ScrollEffect effect;
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
  double _itemPosition = 0.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getItemWidth();
    });
    widget.controller.addListener(_listener);
  }

  void _getItemWidth() {
    if (_itemKey.currentContext != null) {
      RenderBox renderBox =
          _itemKey.currentContext!.findRenderObject() as RenderBox;
      _itemWidth = renderBox.size.width;
    }
  }

  _listener() {
    if (mounted) {
      _itemPosition =
          num.parse((widget.controller.offset / _itemWidth).toStringAsFixed(4))
              as double;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      key: _itemKey,
      animation: widget.controller,
      builder: (context, _) => widget.effect.buildEffect(
          child: widget.child, index: widget.index, position: _itemPosition),
    );
  }
}
