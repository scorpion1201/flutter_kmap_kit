part of '../../main.dart';

class MapTypeOverlayScreen extends StatefulWidget {
  const MapTypeOverlayScreen({ super.key });

  @override
  State<MapTypeOverlayScreen> createState() => _MapTypeOverlayScreenState();
}

class _MapTypeOverlayScreenState extends State<MapTypeOverlayScreen> {

  late KakaoMapApi _kakaoMap;

  String _mapType = "normal";

  bool _roadviewLine = false;
  
  bool _bicycleRoad = false;
  
  bool _hillShading = false;
  
  bool _skyviewHybrid = false;

  @override
  void initState() {
    super.initState();
  }

  void handleChangeMapType(String value) {
    setState(() {
      _mapType = value;
    });

    switch (value) {
      case 'normal':
        _kakaoMap.setMapType(KakaoMapType.normal.toString());
        break;
      case 'skyview':
        _kakaoMap.setMapType(KakaoMapType.skyview.toString());
        break;
    }
  }

  void handleClickMapOverlay(String overlayType, bool visible) {
    switch (overlayType) {
      case 'ROADVIEW_LINE':
        setState(() {
          _roadviewLine = visible;
        });
        if (visible) {
          _kakaoMap.showOverlay(MapOverlay.roadViewLine);
        }
        else {
          _kakaoMap.hideOverlay(MapOverlay.roadViewLine);
        }
        break;
      case 'BICYCLE_ROAD':
        setState(() {
          _bicycleRoad = visible;
        });
        if (visible) {
          _kakaoMap.showOverlay(MapOverlay.bicycleRoad);
        }
        else {
          _kakaoMap.hideOverlay(MapOverlay.bicycleRoad);
        }
        break;
      case 'HILLSHADING':
        setState(() {
          _hillShading = visible;
        });
        if (visible) {
          _kakaoMap.showOverlay(MapOverlay.hillShading);
        }
        else {
          _kakaoMap.hideOverlay(MapOverlay.hillShading);
        }
        break;
      case 'SKYVIEW_HYBRID':
        setState(() {
          _skyviewHybrid = visible;
        });
        if (visible) {
          _kakaoMap.showOverlay(MapOverlay.skyView);
        }
        else {
          _kakaoMap.hideOverlay(MapOverlay.skyView);
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('지도 타입 및 오버레이'),
        backgroundColor: Colors.yellow[700],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'MapType',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: RadioListTile(
                    title: const Text('기본지도'),
                    value: 'normal',
                    groupValue: _mapType,
                    onChanged: (value) => handleChangeMapType(value ?? _mapType),
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    title: const Text('스카이뷰'),
                    value: 'skyview',
                    groupValue: _mapType,
                    onChanged: (value) => handleChangeMapType(value ?? _mapType),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "MapOverlay",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 240,
                  child: CheckboxListTile(
                    title: const Text('ROADVIEW_LINE'),
                    value: _roadviewLine,
                    onChanged: (value) => handleClickMapOverlay(
                      'ROADVIEW_LINE',
                      value ?? false,
                    ),
                  ),
                ),
                SizedBox(
                  width: 240,
                  child: CheckboxListTile(
                    title: const Text('BICYCLE_ROAD'),
                    value: _bicycleRoad,
                    onChanged: (value) => handleClickMapOverlay(
                      'BICYCLE_ROAD',
                      value ?? false,
                    ),
                  ),
                ),
                SizedBox(
                  width: 240,
                  child: CheckboxListTile(
                    title: const Text('HILLSHADING'),
                    value: _hillShading,
                    onChanged: (value) => handleClickMapOverlay(
                      'HILLSHADING',
                      value ?? false,
                    ),
                  ),
                ),
                SizedBox(
                  width: 240,
                  child: CheckboxListTile(
                    title: const Text('SKYVIEW_HYBRID'),
                    value: _skyviewHybrid,
                    onChanged: (value) => handleClickMapOverlay(
                      'SKYVIEW_HYBRID',
                      value ?? false,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: Color.fromRGBO(204, 204, 204, 1.0),
            thickness: 1.0,
          ),
          Expanded(
            child: KakaoMapView(
              mapType: KakaoMapType.normal.toString(),
              zoomLevel: 15,
              latitude: 37.394660,
              longitude: 127.111182,
              onMapReady: (kakaoMap) => _kakaoMap = kakaoMap,
            )
          ),
        ],
      ),
    );
  }
}
