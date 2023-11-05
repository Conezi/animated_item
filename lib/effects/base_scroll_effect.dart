
import 'package:flutter/material.dart';

abstract class ScrollEffect{
  const ScrollEffect();

  Widget buildEffect({required Widget child, required int index, required double position});
}
