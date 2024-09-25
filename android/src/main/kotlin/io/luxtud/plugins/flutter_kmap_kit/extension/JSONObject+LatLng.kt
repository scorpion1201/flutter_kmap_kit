package io.luxtud.plugins.flutter_kmap_kit.extension

import com.kakao.vectormap.LatLng
import org.json.JSONObject

fun LatLng.toJSON(): JSONObject {
  return JSONObject().apply {
    put("lat", latitude)
    put("lng", longitude)
  }
}

fun JSONObject.toLatLng(): LatLng {
  return LatLng.from(
    this.getDouble("lat"),
    this.getDouble("lng")
  )
}