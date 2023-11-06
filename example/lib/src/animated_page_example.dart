
import 'package:animated_item/animated_item.dart';
import 'package:flutter/material.dart';

import 'label.dart';

class AnimatedPageExample extends StatefulWidget {
  const AnimatedPageExample({super.key});

  @override
  State<AnimatedPageExample> createState() => _AnimatedPageExampleState();
}

class _AnimatedPageExampleState extends State<AnimatedPageExample> {
  final _scaleController = PageController();
  final _translateController = PageController();
  final _fadeController = PageController();
  final _rotateController = PageController();
  final colors = [
    Colors.pink,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.brown,
    Colors.purple
  ];

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = (mediaQuery.size.width / 100 * 60);
    return Scaffold(
        appBar: AppBar(
          title: const Text('AnimatedPage example app'),
        ),
        body: ListView(
          children: [
            const Label('Scale Effect'),
            SizedBox(height: 200,
              child: PageView.builder(
                controller: _scaleController,
                itemCount: colors.length,
                itemBuilder: (context, index) {
                  return AnimatedPage(
                      controller: _scaleController,
                      index: index,
                      effect: const ScaleEffect(),
                      child: Container(
                        margin: const EdgeInsets.all(5.0),
                        width: width,
                        color: colors[index],
                      ));
                }, // Can be null
              ),
            ),
            const Label('Translate Effect'),
            SizedBox(height: 200,
              child: PageView.builder(
                controller: _translateController,
                itemCount: colors.length,
                itemBuilder: (context, index) {
                  return AnimatedPage(
                      controller: _translateController,
                      index: index,
                      effect: const TranslateEffect(animationAxis: Axis.vertical),
                      child: Container(
                        margin: const EdgeInsets.all(5.0),
                        width: width,
                        color: colors[index],
                      ));
                }, // Can be null
              ),
            ),
            const Label('Fade Effect'),
            SizedBox(height: 200,
              child: PageView.builder(
                controller: _fadeController,
                itemCount: colors.length,
                itemBuilder: (context, index) {
                  return AnimatedPage(
                      controller: _fadeController,
                      index: index,
                      effect: const FadeEffect(opacity: 1),
                      child: Container(
                        margin: const EdgeInsets.all(5.0),
                        width: width,
                        color: colors[index],
                      ));
                }, // Can be null
              ),
            ),
            const Label('Rotate Effect'),
            SizedBox(height: 200,
              child: PageView.builder(
                controller: _rotateController,
                itemCount: colors.length,
                itemBuilder: (context, index) {
                  return AnimatedPage(
                      controller: _rotateController,
                      index: index,
                      effect: const RotateEffect(),
                      child: Container(
                        margin: const EdgeInsets.all(5.0),
                        width: width,
                        color: colors[index],
                      ));
                }, // Can be null
              ),
            ),
          ],
        )
    );
  }
}
