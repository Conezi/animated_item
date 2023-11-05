import 'package:flutter/material.dart';

class AnimatedItem extends StatefulWidget {
  final ScrollController controller;
  final int index;
  final Widget child;
  const AnimatedItem(
      {required this.controller,
      required this.index,
      required this.child,
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
      builder: (context, _) {
        double delta = (widget.index - _itemPosition).abs();
        double verticalScale = 1.0 - delta * 0.2;
        double horizontalScale = 1.0 - delta * 0.1;
        return Transform(
          transform: Matrix4.identity()..scale(horizontalScale, verticalScale),
          alignment: Alignment.centerLeft,
          child: widget.child,
        );
      },
    );
  }
}
