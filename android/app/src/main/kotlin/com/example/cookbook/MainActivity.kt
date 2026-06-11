package com.example.cookbook

import android.content.pm.ApplicationInfo
import android.content.pm.PackageManager
import android.graphics.Bitmap
import android.graphics.Canvas
import android.content.Context
import android.graphics.drawable.BitmapDrawable
import android.graphics.drawable.Drawable
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.ByteArrayOutputStream

class MainActivity : FlutterActivity() {

    private val CHANNEL = "com.focusflow/apps"

    override fun configureFlutterEngine(
        flutterEngine: FlutterEngine
    ) {

        super.configureFlutterEngine(flutterEngine)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler { call, result ->
             if (call.method == "updateRestrictedApps") {

    val apps =
        call.arguments as? List<*>

    val packageList =
        apps?.map { it.toString() } ?: emptyList()

    val prefs =
        getSharedPreferences(
            "restricted_apps",
            Context.MODE_PRIVATE
        )

    prefs.edit()
        .putStringSet(
            "packages",
            packageList.toSet()
        )
        .apply()

    result.success(true)
}
            if (call.method == "getInstalledApps") {

                val pm = packageManager

                val packages = pm.getInstalledApplications(
                    PackageManager.GET_META_DATA
                )

                val appList =
                    mutableListOf<Map<String, Any>>()

                for (app in packages) {

                    // Skip system apps
                    if ((app.flags and
                        ApplicationInfo.FLAG_SYSTEM) != 0
                    ) {
                        continue
                    }

                    val appName =
                        pm.getApplicationLabel(app).toString()

                    val packageName =
                        app.packageName

                    val iconDrawable =
                        pm.getApplicationIcon(app)

                    val iconBytes =
                        drawableToByteArray(iconDrawable)

                    appList.add(

                        mapOf(

                            "appName" to appName,

                            "packageName" to packageName,

                            "icon" to iconBytes
                        )
                    )
                }

                result.success(appList)

            } else {

                result.notImplemented()
            }
        }
    }

    private fun drawableToByteArray(
        drawable: Drawable
    ): ByteArray {

        val bitmap = if (
            drawable is BitmapDrawable
        ) {

            drawable.bitmap

        } else {

            val bitmap = Bitmap.createBitmap(
                drawable.intrinsicWidth,
                drawable.intrinsicHeight,
                Bitmap.Config.ARGB_8888
            )

            val canvas = Canvas(bitmap)

            drawable.setBounds(
                0,
                0,
                canvas.width,
                canvas.height
            )

            drawable.draw(canvas)

            bitmap
        }

        val stream =
            ByteArrayOutputStream()

        bitmap.compress(
            Bitmap.CompressFormat.PNG,
            100,
            stream
        )

        return stream.toByteArray()
    }
}