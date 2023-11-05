import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'animated_item_method_channel.dart';

abstract class AnimatedItemPlatform extends PlatformInterface {
  /// Constructs a AnimatedItemPlatform.
  AnimatedItemPlatform() : super(token: _token);

  static final Object _token = Object();

  static AnimatedItemPlatform _instance = MethodChannelAnimatedItem();

  /// The default instance of [AnimatedItemPlatform] to use.
  ///
  /// Defaults to [MethodChannelAnimatedItem].
  static AnimatedItemPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AnimatedItemPlatform] when
  /// they register themselves.
  static set instance(AnimatedItemPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
