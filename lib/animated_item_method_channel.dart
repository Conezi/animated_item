import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'animated_item_platform_interface.dart';

/// An implementation of [AnimatedItemPlatform] that uses method channels.
class MethodChannelAnimatedItem extends AnimatedItemPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('animated_item');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
