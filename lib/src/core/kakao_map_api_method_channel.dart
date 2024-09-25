part of flutter_kmap_kit;

/// An implementation of [KakaoMapApi] that uses method channels.
class MethodChannelKakaoMapApi extends KakaoMapApi {
  final int _viewId;

  late final MethodChannel _methodChannel;

  MethodChannelKakaoMapApi(this._viewId) : super() {
    _methodChannel = MethodChannel("$_kakaoMapChannelName/$_viewId", const JSONMethodCodec());
    _methodChannel.setMethodCallHandler(_methodCallHandler);
  }

  @override
  int get id => _viewId;

  Future<void> _methodCallHandler(MethodCall call) async {
    switch (call.method) {
      case "onMapReady":
        _onMapReady();
        break;
      case "onDispose":
        _onDispose();
        break;
      case "onMapClicked":
        _onMapClicked(call.arguments);
        break;
      case "onCameraMoveEnd":
        _onCameraMoveEnd(call.arguments);
        break;
      default:
        break;
    }
  }

  void _onMapReady() {
    print("onMapReady");
    if (onMapReady != null) {
      onMapReady!();
    }
  }

  void _onDispose() {
    _methodChannel.setMethodCallHandler(null);
    if (onDispose != null) {
      onDispose!();
    }
  }

  void _onMapClicked(Map<String, dynamic> json) {
    final position = LatLng.fromMap(json["position"] as Map<String, dynamic>);
    final poi = Poi.fromMap(json["poi"] as Map<String, dynamic>);
    if (onMapClicked != null) {
      onMapClicked!(position, poi);
    }
  }

  void _onCameraMoveEnd(Map<String, dynamic> json) {
    final position = LatLng.fromMap(json["position"] as Map<String, dynamic>);
    final zoomLevel = json["zoomLevel"] as int;
    final tiltAngle = json["tilt"] as double;
    final rotateAngle = json["rotate"] as double;

    final cameraPosition = CameraPosition(
      position: position,
      zoomLevel: zoomLevel,
      tiltAngle: tiltAngle,
      rotationAngle: rotateAngle,
    );

    if (onCameraMoveEnd != null) {
      onCameraMoveEnd!(cameraPosition);
    }
  }

  @override
  Future<void> clearAllCache() async {
    await _methodChannel.invokeMethod<void>("clearAllCache");
  }

  @override
  Future<void> clearDiskCache() async {
    await _methodChannel.invokeMethod<void>("clearDiskCache");
  }

  @override
  Future<LatLng> getPosition() async {
    final position = await _methodChannel.invokeMethod("getPosition", {}) as Map<String, dynamic>;
    return LatLng.fromMap(position);
  }

  @override
  Future<List<String>> getSupportedLanguages() async {
    final supportedLanguages = await _methodChannel.invokeListMethod("getSupportedLanguages", {}) as List<dynamic>;
    return supportedLanguages.map((language) => language as String).toList();
  }

  @override
  Future<int> getZoomLevel() async {
    return await _methodChannel.invokeMethod("getZoomLevel");
  }

  @override
  Future<void> hideCompass() async {
    return await _methodChannel.invokeMethod<void>("hideCompass", {});
  }

  @override
  Future<void> hideOverlay(MapOverlay mapOverlay) async {
    await _methodChannel.invokeMethod<void>("hideOverlay", {
      "mapOverlay": mapOverlay.getValue(),
    });
  }

  @override
  Future<void> hideScaleBar() async {
    return await _methodChannel.invokeMethod<void>("hideScaleBar", {});
  }

  @override
  Future<void> showCompass() async {
    return await _methodChannel.invokeMethod<void>("showCompass", {});
  }

  @override
  Future<void> showOverlay(MapOverlay mapOverlay) async {
    await _methodChannel.invokeMethod<void>("showOverlay", {
      "mapOverlay": mapOverlay.getValue(),
    });
  }

  @override
  Future<void> showScaleBar() async {
    return await _methodChannel.invokeMethod<void>("showScaleBar", {});
  }

  @override
  Future<void> setAutoHide(bool isAutoHide) async {
    return await _methodChannel.invokeMethod<void>("setAutoHide", {
      "isAutoHide": isAutoHide,
    });
  }

  @override
  Future<void> setBackToNorthOnClick(bool isBackToNorthOnClick) async {
    return await _methodChannel.invokeMethod<void>("setBackToNorthOnClick", {
      "isBackToNorthOnClick": isBackToNorthOnClick,
    });
  }

  @override
  Future<void> setGestureEnable(int gestureType, bool enable) async {
    await _methodChannel.invokeMethod<void>("setGestureEnable", {
      "gestureType": gestureType,
      "enable": enable,
    });
  }

  @override
  Future<void> setMapType(String mapType) async {
    await _methodChannel.invokeMethod<void>("setMapType", {
      "mapType": mapType,
    });
  }

  @override
  Future<void> setPoiClickable(bool clickable) async {
    await _methodChannel.invokeMethod<void>("setPoiClickable", {
      "isPoiClickable": clickable,
    });
  }

  @override
  Future<void> setPoiLanguage(String language) async {
    await _methodChannel.invokeMethod<void>("setPoiLanguage", {
      "language": language,
    });
  }

  @override
  Future<void> setPoiScale(String poiScale) async {
    await _methodChannel.invokeMethod<void>("setPoiScale", {
      "poiScale": poiScale,
    });
  }

  @override
  Future<void> setPoiVisible(bool visible) async {
    await _methodChannel.invokeMethod<void>("setPoiVisible", {
      "isPoiVisible": visible,
    });
  }

  @override
  Future<void> setPosition(double latitude, double longitude) async {
    Map<String, dynamic> position = {
      "lat": latitude,
      "lng": longitude,
    };
    await _methodChannel.invokeMethod<void>("setPosition", {
      "position": position,
    });
  }

  @override
  Future<void> setPositionWithAnimation(double latitude, double longitude, int duration) async {
    Map<String, dynamic> position = {
      "lat": latitude,
      "lng": longitude,
    };
    await _methodChannel.invokeMethod<void>("setPositionWithAnimation", {
      "position": position,
      "duration": duration,
    });
  }

  @override
  Future<void> setRotateTo(double angle) async {
    await _methodChannel.invokeMethod<void>("setRotateTo", {
      "angle": angle,
    });
  }

  @override
  Future<void> setTiltTo(double angle) async {
    await _methodChannel.invokeMethod<void>("setTiltTo", {
      "angle": angle,
    });
  }

  @override
  Future<void> setZoomLevel(int zoomLevel) async {
    await _methodChannel.invokeMethod<void>("setZoomLevel", {
      "zoomLevel": zoomLevel,
    });
  }
}