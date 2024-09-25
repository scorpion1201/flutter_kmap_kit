package io.luxtud.plugins.flutter_kmap_kit.extension

import android.graphics.PointF
import org.json.JSONObject

fun PointF.toJSON(): JSONObject {
  return JSONObject().apply {
    put("x", x)
    put("y", y)
  }
}