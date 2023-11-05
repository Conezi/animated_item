#include "include/animated_item/animated_item_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "animated_item_plugin.h"

void AnimatedItemPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  animated_item::AnimatedItemPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
