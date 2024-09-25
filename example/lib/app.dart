part of 'main.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  @override
  void initState() {
    /// Initialize KakaoMap with API key
    KMapKit.initKakaoMap("eddaa2acc49b78c33d3e3afcaa01aa64");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KMapKit Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/kakaoMap': (context) => const KakaoMapScreen(),
        '/kakaoMap/demo': (context) => const KakaoMapDemoScreen(),
        '/kakaoMap/start': (context) => const KakaoMapStartDemoScreen(),
        '/kakaoMap/typeOverlay': (context) => const MapTypeOverlayScreen(),
        '/kakaoMap/pointToLatLng': (context) => const PointToLatlngScreen(),
        '/kakaoMap/poi': (context) => const PoiScreen(),
        '/kakaoMap/compassScaleBar': (context) => const CompaseScalebarScreen(),
      },
    );
  }
}