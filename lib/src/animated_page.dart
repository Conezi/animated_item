import 'package:flutter/material.dart';

import '../effects/base_scroll_effect.dart';
import '../effects/translate_effect.dart';

class AnimatedPage extends StatefulWidget {
  final PageController controller;
  final int index;
  final Widget child;
  final ScrollEffect effect;
  const AnimatedPage(
      {required this.controller,
        required this.index,
        required this.child,
        this.effect = const TranslateEffect(),
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

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, _) => widget.effect.buildEffect(
          child: widget.child, index: widget.index, position: _pagePosition)
    );
  }
}
