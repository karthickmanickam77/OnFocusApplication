package com.example.cookbook

import android.app.Activity
import android.os.Bundle
import android.view.Gravity
import android.widget.TextView

class BlockOverlayActivity : Activity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        val textView = TextView(this)
        textView.text = "App Blocked 🚫"
        textView.textSize = 24f

        textView.gravity = Gravity.CENTER

        setContentView(textView)
    }
}