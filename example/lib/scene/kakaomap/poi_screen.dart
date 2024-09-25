part of '../../main.dart';

class PoiScreen extends StatefulWidget {
  const PoiScreen({ super.key });

  @override
  State<PoiScreen> createState() => _PoiScreenState();
}

class _PoiScreenState extends State<PoiScreen> {

  late KakaoMapApi _kakaoMap;
  bool _showPoi = true;
  bool _clickablePoi = true;
  String _scaleSize = "regular";
  String _languages = "";

  void handleChangeScaleSize(String value) {
    setState(() => _scaleSize = value);

    _kakaoMap.setPoiScale(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Poi Demo'),
        backgroundColor: Colors.yellow[700],
      ),
      body: Column(
        children: <Widget>[
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            scrollDirection: Axis.horizontal,
            child: Column(
              children: <Widget>[
                Text(
                  "Supported Languages: $_languages",
                  style: const TextStyle(
                    fontSize: 16.0
                  ),
                ),
                Row(
                  children: <Widget>[
                    CheckboxTitle(
                      title: "Poi Visible",
                      value: _showPoi,
                      onChanged: (value) {
                        _kakaoMap.setPoiVisible(value);
                        setState(() => _showPoi = value);
                      },
                    ),
                    CheckboxTitle(
                      title: "Poi Clickable",
                      value: _clickablePoi,
                      onChanged: (value) {
                        _kakaoMap.setPoiClickable(value);
                        setState(() => _clickablePoi = value);
                      },
                    ),
                  ],
                ),
                const Text("Poi Scale", style: TextStyle(fontSize: 16.0)),
                Row(
                  children: <Widget>[
                    Radio(
                      value: "small",
                      groupValue: _scaleSize,
                      onChanged: (String? value) => handleChangeScaleSize(value ?? _scaleSize),
                    ),
                    const Text("Small"),
                    Radio(
                      value: "regular",
                      groupValue: _scaleSize,
                      onChanged: (String? value) => handleChangeScaleSize(value ?? _scaleSize),
                    ),
                    const Text("Regular"),
                    Radio(
                      value: "large",
                      groupValue: _scaleSize,
                      onChanged: (String? value) => handleChangeScaleSize(value ?? _scaleSize),
                    ),
                    const Text("Large"),
                    Radio(
                      value: "xlarge",
                      groupValue: _scaleSize,
                      onChanged: (String? value) => handleChangeScaleSize(value ?? _scaleSize),
                    ),
                    const Text("XLarge"),
                  ],
                )
              ],
            ),
          ),
          const Divider(
            color: Color.fromRGBO(204, 204, 204, 1.0),
            thickness: 1.0,
          ),
          Expanded(
            child: Stack(
              children: [
                KakaoMapView(
                  mapType: KakaoMapType.normal.toString(),
                  zoomLevel: 15,
                  latitude: 37.394660,
                  longitude: 127.111182,
                  onMapReady: (kakaoMap) async {
                    _kakaoMap = kakaoMap;
                    List<String> languages = await kakaoMap.getSupportedLanguages();
                    setState(() => _languages = languages.join(", "));
                  },
                  onMapClicked: (position, poi) {
                    if (poi.isPoi) {
                      print("Poi(${poi.poiId}) Clicked: ${poi.name}");
                    }
                  },
                ),
                Positioned(
                  bottom: 16.0,
                  left: 16.0,
                  right: 16.0,
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    color: const Color.fromARGB(128, 182, 182, 182),
                    child: const Text(
                      '지도를 클릭해서 확인하세요!',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}