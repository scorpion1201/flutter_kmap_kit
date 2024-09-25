package io.luxtud.plugins.flutter_kmap_kit.view

import android.app.Activity
import android.content.Context
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.JSONMethodCodec
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

class KakaoMapViewFactory(
  private val activity: Activity,
  private val messenger: BinaryMessenger
): PlatformViewFactory(StandardMessageCodec.INSTANCE) {
  override fun create(context: Context, viewId: Int, args: Any?): PlatformView {
    val options: Map<String, *> = if (args == null) {
      mapOf<String, Any>(
        "mapType" to "map",
        "zoomLevel" to 15,
        "latitude" to 37.56567,
        "longitude" to 126.97800
      )
    } else {
      args as Map<String, *>
    }

    val methodChannel = MethodChannel(
      messenger,
      "$CHANNEL_NAME/$viewId",
      JSONMethodCodec.INSTANCE
    )
    return KakaoMapView(activity, context, viewId, options, methodChannel)
  }

  companion object {
    const val CHANNEL_NAME = "io.luxtud.plugins.flutter_kmap_kit/KakaoMapView"
  }
}