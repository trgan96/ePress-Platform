import 'package:flutter/services.dart';

class AndroidConfig {
  static const platform = MethodChannel('config_channel');

  static Future<void> setAndroidLocale(String language) async {
    try {
      final String result = await platform.invokeMethod('setLocale', {
        'language': language,
      });
      print(result);
    } on PlatformException catch (e) {
      print("Failed to change locale: '${e.message}'.");
    }
  }
}