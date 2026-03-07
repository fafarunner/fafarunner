package com.chenyifaer.fafarunner

import android.os.Bundle
import com.google.android.gms.games.PlayGamesSdk
import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        PlayGamesSdk.initialize(this)
    }
}
