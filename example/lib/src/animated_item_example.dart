import 'package:animated_item/animated_item.dart';
import 'package:flutter/material.dart';

class AnimatedItemExample extends StatefulWidget {
  const AnimatedItemExample({super.key});

  @override
  State<AnimatedItemExample> createState() => _AnimatedItemExampleState();
}

class _AnimatedItemExampleState extends State<AnimatedItemExample> {
  final _scrollController = ScrollController();
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
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: colors.length,
                scrollDirection: Axis.horizontal,
                controller: _scrollController,
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                itemBuilder: (context, index) {
                  return AnimatedItem(
                      controller: _scrollController,
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
