part of '../../main.dart';

class KakaoMapScreen extends StatelessWidget {
  const KakaoMapScreen({ super.key });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('카카오 지도 예제'),
        backgroundColor: Colors.yellow[700],
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        children: <Widget>[
          ListTile(
          title: const Text('KakaoMap'),
          subtitle: const Text('다양한 옵션으로 지도 시작, 크기 등 설정하기'),
          onTap: () => Navigator.pushNamed(context, '/kakaoMap/demo'),
        ),
        ListTile(
          title: const Text('Camera'),
          subtitle: const Text('카메라 확대/축소, 방향, 각도 설정을 통해 지도 움직이기'),
          onTap: () {},
        ),
        ListTile(
          title: const Text('Label'),
          subtitle: const Text('지도에 Label 그리기'),
          onTap: () {},
        ),
        ListTile(
          title: const Text('Shape'),
          subtitle: const Text('지도에 Polygon, Polyline 그리기'),
          onTap: () {},
        ),
        ListTile(
          title: const Text('DimScreen'),
          subtitle: const Text('지도에 DimScreen 나타내기'),
          onTap: () {},
        ),
        ListTile(
          title: const Text('RouteLine'),
          subtitle: const Text('지도에 RouteLine 그리기'),
          onTap: () {},
        ),
        ListTile(
          title: const Text('MapWidget'),
          subtitle: const Text('지도에 InfoWindow 그리기'),
          onTap: () {},
        ),
        ListTile(
          title: const Text('Etc'),
          subtitle: const Text('기타 다양한 지도 활용하기'),
          onTap: () {},
        ),
        ],
      ),
    );
  }
}