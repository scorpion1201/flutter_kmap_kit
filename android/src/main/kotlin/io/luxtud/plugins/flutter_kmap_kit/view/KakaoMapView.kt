package io.luxtud.plugins.flutter_kmap_kit.view

import android.app.Activity
import android.content.Context
import android.graphics.Color
import android.util.Log
import android.view.View
import com.kakao.vectormap.*
import com.kakao.vectormap.camera.CameraAnimation
import com.kakao.vectormap.camera.CameraUpdateFactory
import com.kakao.vectormap.route.*
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.platform.PlatformView
import io.luxtud.plugins.flutter_kmap_kit.extension.toJSON
import io.luxtud.plugins.flutter_kmap_kit.extension.toLatLng
import org.json.JSONObject
import java.util.*

class KakaoMapView(
  activity: Activity,
  private val context: Context,
  private val viewId: Int,
  private val options: Map<String, *>,
  private val methodChannel: MethodChannel
): PlatformView {
  private val mapView: MapView
  private var kakaoMap: KakaoMap? = null
  private var routeLine: RouteLine? = null

  private val methodCallHandler = MethodChannel.MethodCallHandler { call, result ->
    val arguments = call.arguments as JSONObject
    when (call.method) {
      "addRouteLine" -> addRouteLine(arguments, result)
      "clearAllCache" -> clearAllCache(result)
      "clearDiskCache" -> clearDiskCache(result)
      "getPosition" -> getPosition(result)
      "getSupportedLanguages" -> getSupportedLanguages(result)
      "getZoomLevel" -> getZoomLevel(result)
      "hideCompass" -> hideCompass(result)
      "hideOverlay" -> hideOverlay(arguments, result)
      "hideScaleBar" -> hideScaleBar(result)
      "removeRouteLine" -> removeRouteLine(result)
      "showCompass" -> showCompass(result)
      "showOverlay" -> showOverlay(arguments, result)
      "showScaleBar" -> showScaleBar(result)
      "setAutoHide" -> setAutoHide(arguments, result)
      "setBackToNorthOnClick" -> setBackToNorthOnClick(arguments, result)
      "setGestureEnable" -> setGestureEnable(arguments, result)
      "setMapType" -> setMapType(arguments, result)
      "setPoiClickable" -> setPoiClickable(arguments, result)
      "setPoiLanguage" -> setPoiLanguage(arguments, result)
      "setPoiScale" -> setPoiScale(arguments, result)
      "setPoiVisible" -> setPoiVisible(arguments, result)
      "setPosition" -> setPosition(arguments, result)
      "setPositionWithAnimation" -> setPositionWithAnimation(arguments, result)
      "setRotateTo" -> setRotateTo(arguments, result)
      "setTiltTo" -> setTiltTo(arguments, result)
      "setZoomLevel" -> setZoomLevel(arguments, result)
      else -> result.notImplemented()
    }
  }

  override fun getView(): View {
    return mapView
  }

  override fun dispose() {
    mapView.finish()
    methodChannel.invokeMethod("onDispose", null)
    methodChannel.setMethodCallHandler(null)
  }

  private fun guardKakaoMap(result: MethodChannel.Result?): KakaoMap {
    val kakaoMap = kakaoMap ?: run {
      result?.error("NOT_INITIALIZED_MAPVIEW", "KakaoMap is null", null)
      throw Exception("KakaoMap is null")
    }
    return kakaoMap
  }

  private fun guardRouteLineManager(result: MethodChannel.Result?): RouteLineManager {
    val routeLineManager = kakaoMap?.routeLineManager ?: run {
      result?.error("NOT_INITIALIZED_ROUTE_LINE_MANAGER", "RouteLineManager is null", null)
      throw Exception("RouteLineManager is null")
    }
    return routeLineManager
  }

  private fun addRouteLine(arguments: JSONObject, result: MethodChannel.Result) {
    val routeLineManager = guardRouteLineManager(result)
    val layer = routeLineManager.layer

    val styleSet = RouteLineStylesSet.from(
      RouteLineStyles.from(RouteLineStyle.from(16F, Color.BLUE))
    )
    val segments = RouteLineSegment.from(listOf(
      LatLng.from(37.338549743448546,127.09368565409382),
      LatLng.from(37.33856778190988,127.093663107081),
    )).setStyles(styleSet.getStyles(0))
    val options = RouteLineOptions.from(segments).setStylesSet(styleSet)
    routeLine = layer.addRouteLine(options)

    result.success(null)
  }

  private fun clearAllCache(result: MethodChannel.Result) {
    val kakaoMap = guardKakaoMap(result)
    kakaoMap.clearAllCache()
    result.success(null)
  }

  private fun clearDiskCache(result: MethodChannel.Result) {
    val kakaoMap = guardKakaoMap(result)
    kakaoMap.clearDiskCache()
    result.success(null)
  }

  private fun getPosition(result: MethodChannel.Result) {
    val kakaoMap = guardKakaoMap(result)
    val cameraPosition = kakaoMap.cameraPosition ?: run {
      result.error("NOT_FOUND_CAMERA", "Camera is null", null)
      return
    }

    Log.i("KakaoMapView", "getPosition: ${cameraPosition.position.toJSON()}")
    result.success(cameraPosition.position.toJSON())
  }

  private fun getSupportedLanguages(result: MethodChannel.Result) {
    val kakaoMap = guardKakaoMap(result)
    val languages = kakaoMap.supportedLanguages?.toList() ?: emptyList()
    result.success(languages)
  }

  private fun getZoomLevel(result: MethodChannel.Result) {
    val kakaoMap = guardKakaoMap(result)
    result.success(kakaoMap.zoomLevel)
  }

  private fun hideCompass(result: MethodChannel.Result) {
    val kakaoMap = guardKakaoMap(result)
    val compass = kakaoMap.compass;
    compass?.hide();
    result.success(null)
  }

  private fun hideOverlay(arguments: JSONObject, result: MethodChannel.Result) {
    val kakaoMap = guardKakaoMap(result)
    val mapOverlay = MapOverlay.getEnum(arguments.getString("mapOverlay"))
    kakaoMap.hideOverlay(mapOverlay)
    result.success(null)
  }

  private fun hideScaleBar(result: MethodChannel.Result) {
    val kakaoMap = guardKakaoMap(result)
    val scaleBar = kakaoMap.scaleBar
    scaleBar?.hide()
    result.success(null)
  }

  private fun removeRouteLine(result: MethodChannel.Result) {
    val routeLineManager = guardRouteLineManager(result)
    val line = routeLine ?: run {
      result.error("NOT_FOUND_ROUTE_LINE", "Already", null)
      return
    }
    routeLineManager.layer.remove(line)
    result.success(null)
  }

  private fun showCompass(result: MethodChannel.Result) {
    val kakaoMap = guardKakaoMap(result)
    val compass = kakaoMap.compass;
    compass?.show();
    result.success(null)
  }

  private fun showOverlay(arguments: JSONObject, result: MethodChannel.Result) {
    val kakaoMap = guardKakaoMap(result)
    val mapOverlay = MapOverlay.getEnum(arguments.getString("mapOverlay"))
    kakaoMap.showOverlay(mapOverlay)
    result.success(null)
  }

  private fun showScaleBar(result: MethodChannel.Result) {
    val kakaoMap = guardKakaoMap(result)
    val scaleBar = kakaoMap.scaleBar;
    scaleBar?.show();
    result.success(null)
  }

  private fun setAutoHide(arguments: JSONObject, result: MethodChannel.Result) {
    val kakaoMap = guardKakaoMap(result)
    kakaoMap.scaleBar?.isAutoHide = arguments.getBoolean("isAutoHide")
  }

  private fun setBackToNorthOnClick(arguments: JSONObject, result: MethodChannel.Result) {
    val kakaoMap = guardKakaoMap(result)
    kakaoMap.compass?.isBackToNorthOnClick = arguments.getBoolean("isBackToNorthOnClick")
  }

  private fun setGestureEnable(arguments: JSONObject, result: MethodChannel.Result) {
    val kakaoMap = guardKakaoMap(result)
    val gestureType = GestureType.getEnum(arguments.getInt("gestureType"))
    val enable = arguments.getBoolean("enable")
    if (gestureType == GestureType.Unknown) {
      result.error("INVALID_GESTURE_TYPE", "Invalid gesture type", null)
      return
    }
    kakaoMap.setGestureEnable(gestureType, enable)
    result.success(null)
  }

  private fun setMapType(arguments: JSONObject, result: MethodChannel.Result) {
    val kakaoMap = guardKakaoMap(result)
    val mapType = MapType.getEnum(arguments.getString("mapType"))
    kakaoMap.changeMapViewInfo(MapViewInfo.from("openmap", mapType))
    result.success(null)
  }

  private fun setPoiClickable(arguments: JSONObject, result: MethodChannel.Result) {
    val kakaoMap = guardKakaoMap(result)
    val isPoiClickable = arguments.getBoolean("isPoiClickable")
    kakaoMap.isPoiClickable = isPoiClickable
    result.success(null)
  }

  private fun setPoiLanguage(arguments: JSONObject, result: MethodChannel.Result) {
    val kakaoMap = guardKakaoMap(result)
    val language = arguments.getString("language")
    kakaoMap.setPoiLanguage(language)
    result.success(null)
  }

  private fun setPoiScale(arguments: JSONObject, result: MethodChannel.Result) {
    val kakaoMap = guardKakaoMap(result)
    val poiScale = arguments.getString("poiScale").lowercase()
    when (poiScale) {
      "small" -> kakaoMap.poiScale = PoiScale.SMALL
      "regular" -> kakaoMap.poiScale = PoiScale.REGULAR
      "large" -> kakaoMap.poiScale = PoiScale.LARGE
      "xlarge" -> kakaoMap.poiScale = PoiScale.XLARGE
      else -> {
        result.error("INVALID_SCALE_SIZE", "Invalid scale size", null)
        return
      }
    }
    result.success(null)
  }

  private fun setPoiVisible(arguments: JSONObject, result: MethodChannel.Result) {
    val kakaoMap = guardKakaoMap(result)
    val isPoiVisible = arguments.getBoolean("isPoiVisible")
    kakaoMap.isPoiVisible = isPoiVisible
    result.success(null)
  }

  private fun setPosition(arguments: JSONObject, result: MethodChannel.Result) {
    val kakaoMap = guardKakaoMap(result)
    val position = arguments.getJSONObject("position").toLatLng()
    kakaoMap.moveCamera(CameraUpdateFactory.newCenterPosition(position))
    result.success(null)
  }

  private fun setPositionWithAnimation(arguments: JSONObject, result: MethodChannel.Result) {
    val kakaoMap = guardKakaoMap(result)
    val position = arguments.getJSONObject("position").toLatLng()
    val duration = arguments.getInt("duration")
    kakaoMap.moveCamera(CameraUpdateFactory.newCenterPosition(position), CameraAnimation.from(duration))
    result.success(null)
  }

  private fun setRotateTo(arguments: JSONObject, result: MethodChannel.Result) {
    val kakaoMap = guardKakaoMap(result)
    val radian = Math.toRadians(arguments.getDouble("angle"))
    kakaoMap.moveCamera(CameraUpdateFactory.rotateTo(radian))
    result.success(null)
  }

  private fun setTiltTo(arguments: JSONObject, result: MethodChannel.Result) {
    val kakaoMap = guardKakaoMap(result)
    val radian = Math.toRadians(arguments.getDouble("angle"))
    kakaoMap.moveCamera(CameraUpdateFactory.tiltTo(radian))
    result.success(null)
  }

  private fun setZoomLevel(arguments: JSONObject, result: MethodChannel.Result) {
    val kakaoMap = guardKakaoMap(result)
    val zoomLevel = arguments.getInt("zoomLevel")
    kakaoMap.moveCamera(CameraUpdateFactory.zoomTo(zoomLevel))
    result.success(null)
  }

  init {
    methodChannel.setMethodCallHandler(methodCallHandler);

    mapView = MapView(activity)

    mapView.start(
      object : MapLifeCycleCallback() {
        override fun onMapDestroy() {
        }

        override fun onMapError(error: Exception) {
           print("${error.message}")
        }
      },
      object : KakaoMapReadyCallback() {
        override fun onMapReady(map: KakaoMap) {
          kakaoMap = map

          // set scale bar
          val scaleBar = map.scaleBar;
          scaleBar?.setPosition(MapGravity.LEFT or MapGravity.BOTTOM, 20f, 20f);
          scaleBar?.hide();

          //send onMapClicked event to Flutter
          map.setOnMapClickListener { _, position, screenPoint, poi ->
            val json = JSONObject().apply {
              put("position", position.toJSON())
              put("screenPoint", screenPoint.toJSON())
              put("poi", poi.toJSON())
            }
            methodChannel.invokeMethod("onMapClicked", json)
          }

          // send onCameraMove event to Flutter
          map.setOnCameraMoveEndListener { _, cameraPosition, _ -> // send onCameraMoveEnd event to Flutter
            val json = JSONObject().apply {
              put("position", cameraPosition.position.toJSON())
              put("zoomLevel", cameraPosition.zoomLevel)
              put("tilt", cameraPosition.tiltAngle)
              put("rotate", cameraPosition.rotationAngle)
            }
            methodChannel.invokeMethod("onCameraMoveEnd", json)
          }

          // send onMapReady event to Flutter
          methodChannel.invokeMethod("onMapReady", null)
        }

        override fun getPosition(): LatLng {
          return LatLng.from(
            options["latitude"] as Double,
            options["longitude"] as Double)
        }

        override fun getZoomLevel(): Int {
          return options["zoomLevel"] as Int
        }

        override fun getMapViewInfo(): MapViewInfo {
          return MapViewInfo.from("openmap", MapType.getEnum(options["mapType"] as String))
        }

        override fun getViewName(): String {
          return "KMapKakao"
        }

        override fun getTag(): Any {
          return "KMapKakao_$viewId"
        }
      }
    )
  }
}