import 'package:flutter/material.dart';

class AnimatedPage extends StatefulWidget {
  final PageController controller;
  final Widget child;
  final Axis animationAxis;
  const AnimatedPage(
      {required this.controller,
        required this.child,
        this.animationAxis = Axis.vertical,
        super.key});

  @override
  State<AnimatedPage> createState() => _AnimatedPageState();
}

class _AnimatedPageState extends State<AnimatedPage> {
  int _currentPosition = 0;
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
        _currentPosition = widget.controller.page!.floor();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, _) {
        double delta = (_currentPosition - _pagePosition).abs();
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
