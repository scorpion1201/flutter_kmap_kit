part of '../../main.dart';

class KakaoMapStartDemoScreen extends StatelessWidget {
  const KakaoMapStartDemoScreen({ super.key });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('인증과 지도 시작'),
        backgroundColor: Colors.yellow[700],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '1. 지도 시작 위치',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text('37.394660', style: TextStyle(fontSize: 16)),
                    ),
                    Expanded(
                      child: Text('127.111182', style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    '2. 시작 줌레벨',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
                Expanded(
                  child: Text('15', textAlign: TextAlign.right, style: TextStyle(fontSize: 16)),
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
            )
          ),
        ],
      ),
    );
  }
}