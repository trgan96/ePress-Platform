package com.appvity.ptth

import android.annotation.SuppressLint
import android.app.LocaleManager
import android.content.res.Configuration
import android.os.Build
import android.os.LocaleList
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.util.Locale
import android.util.Log
import androidx.annotation.RequiresApi
import androidx.core.view.WindowCompat

class MainActivity : FlutterActivity() {
    private val CHANNEL = "config_channel"

    @RequiresApi(Build.VERSION_CODES.M)
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler { call, result ->
            if (call.method == "setLocale") {
                val language = call.argument<String>("language") ?: "en"
                when (language) {
                    "vi" -> {
                        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
                            getSystemService(
                                LocaleManager::class.java
                            ).applicationLocales = LocaleList(Locale.forLanguageTag("vi-VN"))
                        }
                    }
                    "en" -> if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
                        getSystemService(
                            LocaleManager::class.java
                        ).applicationLocales = LocaleList(Locale.forLanguageTag("en-US"))
                    }
                }
            } else {
                result.notImplemented()
            }
        }
    }
}
