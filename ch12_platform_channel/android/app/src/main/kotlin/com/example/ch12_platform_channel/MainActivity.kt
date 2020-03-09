package com.example.ch12_platform_channel

import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugins.GeneratedPluginRegistrant;

import io.flutter.plugin.common.MethodChannel;
import android.os.Build;

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "platformchannel.companyname.com/deviceinfo").setMethodCallHandler {
            call, result ->
            if(call.method == "getDeviceInfo") {
                val deviceInfo = getDeviceInfo()
                result.success(deviceInfo)
            }
            else {
                result.notImplemented()
            }
        }
    }

    private fun getDeviceInfo() : String {
        return (
            "\nDevice: " + Build.DEVICE
            + "\nManufacurer: " + Build.MANUFACTURER
            + "\nModel: " + Build.MODEL
            + "\nProduct: " + Build.PRODUCT
            + "\nVersion Release: " + Build.VERSION.RELEASE
            + "\nVersion SDK: " + Build.VERSION.SDK_INT
            + "\nFingerprint: " + Build.FINGERPRINT
        )
    }
}
