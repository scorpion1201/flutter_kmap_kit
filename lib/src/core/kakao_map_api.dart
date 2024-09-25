part of flutter_kmap_kit;

abstract class KakaoMapApi extends PlatformInterface {
  KakaoMapApi() : super(token: _token);

  static final Object _token = Object();

  static KakaoMapApi? _instance;

  static KakaoMapApi getInstance(int id) {
    _instance ??= MethodChannelKakaoMapApi(id);
    return _instance!;
  }

  late final void Function()? onMapReady;
  late final void Function()? onDispose;
  late final void Function(LatLng position, Poi poi)? onMapClicked;
  late final void Function(CameraPosition cameraPosition)? onCameraMoveEnd;

  int get id;

  Future<void> clearAllCache() {
    throw UnimplementedError('clearAllCache() has not been implemented.');
  }

  Future<void> clearDiskCache() {
    throw UnimplementedError('clearTileCache() has not been implemented.');
  }

  Future<LatLng> getPosition() {
    throw UnimplementedError('getPosition() has not been implemented.');
  }

  Future<List<String>> getSupportedLanguages() {
    throw UnimplementedError('getSupportedLanguages() has not been implemented.');
  }

  Future<int> getZoomLevel() {
    throw UnimplementedError('getZoomLevel() has not been implemented.');
  }

  Future<void> hideCompass() {
    throw UnimplementedError('hideCompass() has not been implemented.');
  }

  Future<void> hideOverlay(MapOverlay mapOverlay) {
    throw UnimplementedError('hideOverlay() has not been implemented.');
  }

  Future<void> hideScaleBar() {
    throw UnimplementedError('hideScaleBar() has not been implemented.');
  }

  Future<void> showCompass() {
    throw UnimplementedError('setCompassEnabled() has not been implemented.');
  }

  Future<void> showOverlay(MapOverlay mapOverlay) {
    throw UnimplementedError('showOverlay() has not been implemented.');
  }

  Future<void> showScaleBar() {
    throw UnimplementedError('showScaleBar() has not been implemented.');
  }

  Future<void> setAutoHide(bool isAutoHide) {
    throw UnimplementedError('setAutoHide() has not been implemented.');
  }

  Future<void> setBackToNorthOnClick(bool isBackToNorthOnClick) {
    throw UnimplementedError('setBackToNorthOnClick() has not been implemented.');
  }

  Future<void> setGestureEnable(int gestureType, bool enable) {
    throw UnimplementedError('setGestureEnable() has not been implemented.');
  }

  Future<void> setMapType(String mapType) {
    throw UnimplementedError('setMapType() has not been implemented.');
  }

  Future<void> setPoiClickable(bool clickable) {
    throw UnimplementedError('setPoiClickable() has not been implemented.');
  }

  Future<void> setPoiLanguage(String language) {
    throw UnimplementedError('setZoomControlEnabled() has not been implemented.');
  }

  Future<void> setPoiScale(String poiScale) {
    throw UnimplementedError('setPoiScale() has not been implemented.');
  }

  Future<void> setPoiVisible(bool visible) {
    throw UnimplementedError('setPoiVisible() has not been implemented.');
  }

  Future<void> setPosition(double latitude, double longitude) {
    throw UnimplementedError('setPosition() has not been implemented.');
  }

  Future<void> setPositionWithAnimation(double latitude, double longitude, int duration) {
    throw UnimplementedError('setPositionWithAnimation() has not been implemented.');
  }

  Future<void> setRotateTo(double angle) {
    throw UnimplementedError('setRotateTo() has not been implemented.');
  }

  Future<void> setTiltTo(double angle) {
    throw UnimplementedError('setTiltTo() has not been implemented.');
  }

  Future<void> setZoomLevel(int zoomLevel) {
    throw UnimplementedError('setZoomLevel() has not been implemented.');
  }
}