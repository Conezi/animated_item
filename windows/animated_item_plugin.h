#ifndef FLUTTER_PLUGIN_ANIMATED_ITEM_PLUGIN_H_
#define FLUTTER_PLUGIN_ANIMATED_ITEM_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace animated_item {

class AnimatedItemPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  AnimatedItemPlugin();

  virtual ~AnimatedItemPlugin();

  // Disallow copy and assign.
  AnimatedItemPlugin(const AnimatedItemPlugin&) = delete;
  AnimatedItemPlugin& operator=(const AnimatedItemPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace animated_item

#endif  // FLUTTER_PLUGIN_ANIMATED_ITEM_PLUGIN_H_
