part of '../../main.dart';

class PointToLatlngScreen extends StatefulWidget {
  const PointToLatlngScreen({ super.key });

  @override
  _PointToLatlngScreenState createState() => _PointToLatlngScreenState();
}

class _PointToLatlngScreenState extends State<PointToLatlngScreen> {

  double? _latitude;
  double? _longitude;

  @override
  void initState() {
    super.initState();
  }

  String get _WSG84 {
    if (_latitude == null || _longitude == null) {
      return "LatLng";
    }
    return "Lat = ${_latitude!.toStringAsFixed(6)}, Lng = ${_longitude!.toStringAsFixed(6)}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ScreenPoint to LatLng Demo'),
        backgroundColor: Colors.yellow[700],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                Expanded(
                  child: KakaoMapView(
                    mapType: KakaoMapType.normal.toString(),
                    zoomLevel: 15,
                    latitude: 37.521641,
                    longitude: 126.924200,
                    onMapReady: (kakaoMap) async {
                      kakaoMap.getPosition().then((point) {
                        setState(() {
                          _latitude = point.latitude;
                          _longitude = point.longitude;
                        });
                      });
                    },
                    onCameraMoveEnd: (cameraPosition) => setState(() {
                      _latitude = cameraPosition.position.latitude;
                      _longitude = cameraPosition.position.longitude;
                    })
                  ),
                ),
                Positioned(
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      _WSG84,
                      style: const TextStyle(
                        backgroundColor: Color.fromRGBO(128, 184, 182, 0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.black,
                  ),
                ),
                Center(
                  child: Container(
                    width: 1,
                    height: double.infinity,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}