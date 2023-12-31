// Copyright 2023 Conezi. All rights reserved.
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
  final _verticalTranslateController = PageController();
  final _horizontalTranslateController = PageController();
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

  final _borderRadius = const BorderRadius.all(Radius.circular(8.0));

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
            SizedBox(
              height: 200,
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
                        decoration: BoxDecoration(
                            color: colors[index], borderRadius: _borderRadius),
                      ));
                }, // Can be null
              ),
            ),
            const Label('Vertical Translate Effect'),
            SizedBox(
              height: 200,
              child: PageView.builder(
                controller: _verticalTranslateController,
                itemCount: colors.length,
                itemBuilder: (context, index) {
                  return AnimatedPage(
                      controller: _verticalTranslateController,
                      index: index,
                      effect:
                          const TranslateEffect(animationAxis: Axis.vertical),
                      child: Container(
                        margin: const EdgeInsets.all(5.0),
                        width: width,
                        decoration: BoxDecoration(
                            color: colors[index], borderRadius: _borderRadius),
                      ));
                }, // Can be null
              ),
            ),
            const Label('Horizontal Translate Effect'),
            SizedBox(
              height: 200,
              child: PageView.builder(
                controller: _horizontalTranslateController,
                itemCount: colors.length,
                itemBuilder: (context, index) {
                  return AnimatedPage(
                      controller: _horizontalTranslateController,
                      index: index,
                      effect:
                          const TranslateEffect(animationAxis: Axis.horizontal),
                      child: Container(
                        margin: const EdgeInsets.all(5.0),
                        width: width,
                        decoration: BoxDecoration(
                            color: colors[index], borderRadius: _borderRadius),
                      ));
                }, // Can be null
              ),
            ),
            const Label('Fade Effect'),
            SizedBox(
              height: 200,
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
                        decoration: BoxDecoration(
                            color: colors[index], borderRadius: _borderRadius),
                      ));
                }, // Can be null
              ),
            ),
            const Label('Rotate Effect'),
            SizedBox(
              height: 200,
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
                        decoration: BoxDecoration(
                            color: colors[index], borderRadius: _borderRadius),
                      ));
                }, // Can be null
              ),
            ),
          ],
        ));
  }
}
