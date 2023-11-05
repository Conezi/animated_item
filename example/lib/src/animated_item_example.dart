import 'package:animated_item/animated_item.dart';
import 'package:animated_item_example/src/label.dart';
import 'package:flutter/material.dart';

class AnimatedItemExample extends StatefulWidget {
  const AnimatedItemExample({super.key});

  @override
  State<AnimatedItemExample> createState() => _AnimatedItemExampleState();
}

class _AnimatedItemExampleState extends State<AnimatedItemExample> {
  final _scaleController = ScrollController();
  final _translateController = ScrollController();
  final _fadeController = ScrollController();
  final _rotateController = ScrollController();
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
          title: const Text('AnimatedItem example app'),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          children: [
            const Label('Scale Effect'),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: colors.length,
                scrollDirection: Axis.horizontal,
                controller: _scaleController,
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                itemBuilder: (context, index) {
                  return AnimatedItem(
                      controller: _scaleController,
                      index: index,
                      effect: const ScaleEffect(),
                      child: Container(
                        margin: const EdgeInsets.all(5.0),
                        width: width,
                        color: colors[index],
                      ));
                },
              ),
            ),
            const Label('Translate Effect'),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: colors.length,
                scrollDirection: Axis.horizontal,
                controller: _translateController,
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                itemBuilder: (context, index) {
                  return AnimatedItem(
                      controller: _translateController,
                      index: index,
                      effect: const TranslateEffect(animationAxis: Axis.vertical, start: 5),
                      child: Container(
                        margin: const EdgeInsets.all(5.0),
                        width: width,
                        color: colors[index],
                      ));
                },
              ),
            ),
            const Label('Fade Effect'),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: colors.length,
                scrollDirection: Axis.horizontal,
                controller: _fadeController,
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                itemBuilder: (context, index) {
                  return AnimatedItem(
                      controller: _fadeController,
                      index: index,
                      effect: const FadeEffect(),
                      child: Container(
                        margin: const EdgeInsets.all(5.0),
                        width: width,
                        color: colors[index],
                      ));
                },
              ),
            ),
            const Label('Fade Effect'),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: colors.length,
                scrollDirection: Axis.horizontal,
                controller: _rotateController,
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                itemBuilder: (context, index) {
                  return AnimatedItem(
                      controller: _rotateController,
                      index: index,
                      effect: const RotateEffect(),
                      child: Container(
                        margin: const EdgeInsets.all(5.0),
                        width: width,
                        color: colors[index],
                      ));
                },
              ),
            ),
          ],
        ));
  }
}
