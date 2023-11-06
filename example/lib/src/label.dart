// Copyright 2023 Conezi. All rights reserved.
import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  final String label;
  const Label(this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
        child: Text(label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
      ),
    );
  }
}
