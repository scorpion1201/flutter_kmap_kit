part of '../../main.dart';

class KakaoMapDemoScreen extends StatelessWidget {
  const KakaoMapDemoScreen({ super.key });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KakaoMaps Api Demo List'),
        backgroundColor: Colors.yellow[700],
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        children: <Widget>[
          ListTile(
            title: const Text('인증과 지도 시작'),
            subtitle: const Text('Start, MapAuthToken, KakaoMapReadyCallback'),
            onTap: () => Navigator.pushNamed(context, '/kakaoMap/start'),
          ),
          ListTile(
            title: const Text('지도 타입 및 오버레이'),
            subtitle: const Text('MapType, MapOverlay'),
            onTap: () => Navigator.pushNamed(context, '/kakaoMap/typeOverlay'),
          ),
          ListTile(
            title: const Text('지도화면 크기 및 패딩 변경'),
            subtitle: const Text('Viewport, Padding'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('스크린 위치와 좌표 간 변환'),
            subtitle: const Text('fromScreenPoint, toScreenPoint'),
            onTap: () => Navigator.pushNamed(context, '/kakaoMap/pointToLatLng'),
          ),
          ListTile(
            title: const Text('지도의 Poi 설정'),
            subtitle: const Text('Poi Clickable, Visible, Scale, Language'),
            onTap: () => Navigator.pushNamed(context, '/kakaoMap/poi'),
          ),
          ListTile(
            title: const Text('나침반, 축척 설정'),
            subtitle: const Text('Compass, ScaleBar'),
            onTap: () => Navigator.pushNamed(context, '/kakaoMap/compassScaleBar'),
          ),
        ],
      ),
    );
  }
}