package com.example.cookbook

import android.accessibilityservice.AccessibilityService
import android.content.Intent
import android.util.Log
import android.view.accessibility.AccessibilityEvent

class AppBlockAccessibilityService : AccessibilityService() {

    override fun onAccessibilityEvent(event: AccessibilityEvent?) {

        if (event?.eventType ==
            AccessibilityEvent.TYPE_WINDOW_STATE_CHANGED) {

            val packageName =
                event.packageName?.toString() ?: return

            if (packageName == "com.example.cookbook") return

            Log.d("APP_BLOCKER", "Opened App: $packageName")

            val prefs =
            getSharedPreferences(
            "restricted_apps",
             MODE_PRIVATE
                         )

              val blockedApps =
                prefs.getStringSet(
               "packages",
                emptySet()
                           )

            if (blockedApps?.contains(packageName) == true) {

                Log.d("APP_BLOCKER", " BLOCKED")

                val intent =
                    Intent(this, BlockOverlayActivity::class.java)

                intent.addFlags(
                    Intent.FLAG_ACTIVITY_NEW_TASK or
                    Intent.FLAG_ACTIVITY_CLEAR_TOP or
                    Intent.FLAG_ACTIVITY_SINGLE_TOP
                )

                startActivity(intent)
            }
        }
    }

    override fun onInterrupt() {}
}