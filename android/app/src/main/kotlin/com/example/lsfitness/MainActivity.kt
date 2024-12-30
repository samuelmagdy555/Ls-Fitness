package com.example.lsfitness

import android.content.Intent
import android.net.Uri
import android.os.Bundle
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterFragmentActivity() {
    private val CHANNEL = "deep_link"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        // تأكد من أن binaryMessenger غير nullable
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
                .setMethodCallHandler { call, result ->
                    if (call.method == "onDeepLink") {
                        val deepLink = handleDeepLink(intent)
                        if (deepLink != null) {
                            result.success(deepLink)
                        } else {
                            result.error("NO_DEEP_LINK", "No deep link found", null)
                        }
                    } else {
                        result.notImplemented()
                    }
                }
    }

    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
        setIntent(intent)

        val deepLink = handleDeepLink(intent)
        if (deepLink != null) {
            MethodChannel(flutterEngine!!.dartExecutor.binaryMessenger, CHANNEL)
                    .invokeMethod("onDeepLink", deepLink)
        }
    }

    private fun handleDeepLink(intent: Intent): String? {
        val action = intent.action
        val data: Uri? = intent.data

        return if (action == Intent.ACTION_VIEW && data != null) {
            data.toString()
        } else {
            null
        }
    }
}
