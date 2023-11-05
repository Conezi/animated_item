import 'package:flutter_test/flutter_test.dart';
import 'package:animated_item/animated_item_platform_interface.dart';
import 'package:animated_item/animated_item_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAnimatedItemPlatform
    with MockPlatformInterfaceMixin
    implements AnimatedItemPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AnimatedItemPlatform initialPlatform = AnimatedItemPlatform.instance;

  test('$MethodChannelAnimatedItem is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAnimatedItem>());
  });
}
