import 'package:animated_item_example/src/animated_page_example.dart';
import 'package:flutter/material.dart';

import 'src/animated_item_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('AnimatedItem example app'),
            ),
            body: Builder(
              builder: (context) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const AnimatedItemExample())),
                          child: const Text('Animated Item')),
                      ElevatedButton(
                          onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const AnimatedPageExample())),
                          child: const Text('Animated Page'))
                    ],
                  ),
                );
              }
            )));
  }
}
