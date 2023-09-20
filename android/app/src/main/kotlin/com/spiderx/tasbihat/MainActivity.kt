package com.spiderx.tasbihat

import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {
}

//class MainActivity: FlutterActivity(), AmbientMode.AmbientCallbackProvider {
//    override fun onCreate(savedInstanceState: Bundle?) {
//        super.onCreate(savedInstanceState)
//        GeneratedPluginRegistrant.registerWith(this)
//
//        // Wire up the activity for ambient callbacks
//        AmbientMode.attachAmbientSupport(this)
//    }
//
//    override fun getAmbientCallback(): AmbientMode.AmbientCallback {
//        return FlutterAmbientCallback(getChannel(flutterView))
//    }
//}
