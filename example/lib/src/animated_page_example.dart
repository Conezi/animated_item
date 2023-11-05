
import 'package:animated_item/animated_item.dart';
import 'package:flutter/material.dart';

class AnimatedPageExample extends StatefulWidget {
  const AnimatedPageExample({super.key});

  @override
  State<AnimatedPageExample> createState() => _AnimatedPageExampleState();
}

class _AnimatedPageExampleState extends State<AnimatedPageExample> {
  final _pageController = PageController();
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
        body: PageView.builder(
          controller: _pageController,
          itemCount: colors.length,
          physics: const BouncingScrollPhysics(),
          onPageChanged: (_) => setState(() {}),
          itemBuilder: (context, index) {
            return AnimatedPage(
                controller: _pageController,
                index: index,
                child: Container(
                  margin: const EdgeInsets.all(5.0),
                  width: width,
                  color: colors[index],
                ));
          }, // Can be null
        )
    );
  }
}
