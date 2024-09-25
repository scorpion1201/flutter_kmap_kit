package io.luxtud.plugins.flutter_kmap_kit.extension

import com.kakao.vectormap.Poi
import org.json.JSONObject

fun Poi.toJSON(): JSONObject {
  return JSONObject().apply {
    put("isPoi", isPoi)
    put("layerId", layerId)
    put("poiId", poiId)
    put("name", name)
  }
}