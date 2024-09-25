part of flutter_kmap_kit;

class KakaoMapView extends StatefulWidget {
  const KakaoMapView({
    super.key,
    this.mapType = "map",
    this.zoomLevel = 15,
    this.latitude = 37.56567,
    this.longitude = 126.97800,
    this.onMapReady,
    this.onMapClicked,
    this.onCameraMoveEnd,
  });

  final String mapType;
  final int zoomLevel;
  final double latitude;
  final double longitude;
  final Function(KakaoMapApi kakaoMap)? onMapReady;
  final Function(LatLng position, Poi poi)? onMapClicked;
  final Function(CameraPosition cameraPosition)? onCameraMoveEnd;

  @override
  State<StatefulWidget> createState() => _KakaoMapViewState();
}

class _KakaoMapViewState extends State<KakaoMapView> {
  KakaoMapApi? _api;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _api = null;
    super.dispose();
  }

  void _onPlatformViewCreated(int id) {
    _api = KakaoMapApiGateway.getInstance(id);
    if (_api != null) {
      _api!.onMapReady = () => widget.onMapReady != null ? widget.onMapReady!(_api!) : null;
      _api!.onMapClicked = widget.onMapClicked;
      _api!.onCameraMoveEnd = widget.onCameraMoveEnd;
    }
  }

  @override
  Widget build(BuildContext context) {
    const viewType = _viewId;

    final Map<String, dynamic> creationParams = <String, dynamic>{
      "mapType": widget.mapType,
      "zoomLevel": widget.zoomLevel,
      "latitude": widget.latitude,
      "longitude": widget.longitude,
    };

    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return AndroidView(
          viewType: viewType,
          creationParams: creationParams,
          creationParamsCodec: const StandardMessageCodec(),
          onPlatformViewCreated: _onPlatformViewCreated,
        );
      case TargetPlatform.iOS:
        return UiKitView(
          viewType: viewType,
          creationParams: creationParams,
          creationParamsCodec: const StandardMessageCodec(),
        );
      default:
        throw PlatformException(code: "Unsupport Platform");
    }
  }
}