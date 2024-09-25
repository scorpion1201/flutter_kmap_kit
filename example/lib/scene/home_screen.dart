part of '../main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ super.key });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KMapKit 예제'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        children: <Widget>[
          ListTile(
            title: const Text('카카오 지도'),
            subtitle: const Text('카카오 지도 예제'),
            onTap: () => Navigator.pushNamed(context, '/kakaoMap'),
          ),
          ListTile(
            title: const Text('네이버 지도'),
            subtitle: const Text('네이버 지도 예제'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Tmap 지도'),
            subtitle: const Text('Tmap 지도 예제'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}