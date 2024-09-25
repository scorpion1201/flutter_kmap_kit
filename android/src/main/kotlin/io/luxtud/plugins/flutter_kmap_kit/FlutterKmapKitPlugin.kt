package io.luxtud.plugins.flutter_kmap_kit

import com.kakao.vectormap.KakaoMapSdk
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.StandardMethodCodec
import io.luxtud.plugins.flutter_kmap_kit.view.KakaoMapViewFactory

/** FlutterKmapKitPlugin */
class FlutterKmapKitPlugin: FlutterPlugin, ActivityAware, MethodCallHandler {

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    pluginBinding = flutterPluginBinding
    channel = MethodChannel(
      flutterPluginBinding.binaryMessenger,
      CHANNEL_NAME,
      StandardMethodCodec.INSTANCE)
    channel.setMethodCallHandler(this)
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
    when (call.method) {
      "initKakaoMap" -> {
        // check if arguments is null
        if (call.arguments == null) {
          result.error("INVALID_ARGUMENTS", "Arguments is null", null)
          return
        }

        // call.arguments cast List<String> to String
        val args = call.arguments as List<*>

        // initialize KakaoMapSdk
        KakaoMapSdk.init(pluginBinding.applicationContext, args[0] as String)

        // return success
        result.success(null)
      }
      else -> result.notImplemented()
    }
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    pluginBinding.platformViewRegistry.registerViewFactory(
      MAP_VIEW_ID,
      KakaoMapViewFactory(binding.activity, pluginBinding.binaryMessenger)
    )
  }

  override fun onDetachedFromActivityForConfigChanges() {
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
  }

  override fun onDetachedFromActivity() {
  }

  companion object {
    private const val BASE_ORG = "io.luxtud.plugins.flutter_kmap_kit"

    private const val CHANNEL_NAME = "${BASE_ORG}/kmap_plugin"

    private const val MAP_VIEW_ID = "${BASE_ORG}/flutter_kmap_kit"

    private lateinit var pluginBinding: FlutterPlugin.FlutterPluginBinding

    private lateinit var channel : MethodChannel
  }
}
