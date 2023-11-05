import 'package:flutter/material.dart';

class AnimatedPage extends StatefulWidget {
  final PageController controller;
  final int index;
  final Widget child;
  final Axis animationAxis;
  const AnimatedPage(
      {required this.controller,
        required this.index,
        required this.child,
        this.animationAxis = Axis.vertical,
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
    final size = MediaQuery.of(context).size;
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, _) {
        double delta = _pagePosition - widget.index;
        double start = widget.animationAxis == Axis.horizontal
            ? (size.width * 0.105) * delta.abs() * 10
            : (size.height * 0.105) * delta.abs() * 10;

        return Transform.translate(
            offset: (widget.animationAxis == Axis.horizontal
                ? Offset(start, 0)
                : Offset(0, -start)),
            child: widget.child
        );
      },
    );
  }
}
