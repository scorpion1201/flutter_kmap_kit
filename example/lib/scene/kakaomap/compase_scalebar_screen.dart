part of '../../main.dart';

class CompaseScalebarScreen extends StatefulWidget {
  const CompaseScalebarScreen({ super.key });

  @override
  State<CompaseScalebarScreen> createState() => _CompaseScalebarScreenState();
}

class _CompaseScalebarScreenState extends State<CompaseScalebarScreen> {

  KakaoMapApi? _kakaoMap;

  bool _showCompass = true;
  bool _showScaleBar = true;
  bool _autoHideScaleBar = true;
  bool _backToNorthOnClick = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Compass, ScaleBar Demo'),
        backgroundColor: Colors.yellow[700],
      ),
      body: Expanded(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text("ScaleBar: ", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
              Row(
                children: <Widget>[
                  Expanded(child:
                    CheckboxListTile(
                      title: const Text("Show/Hide"),
                      value: _showScaleBar,
                      onChanged: (value) {
                        bool isChecked = value ?? _showScaleBar;
                        if (isChecked) {
                          _kakaoMap?.showScaleBar();
                        } else {
                          _kakaoMap?.hideScaleBar();
                        }
                        setState(() => _showScaleBar = isChecked);
                      },
                    )
                  ),
                  Expanded(child:
                    CheckboxListTile(
                      title: const Text("AutoHide"),
                      value: _autoHideScaleBar,
                      onChanged: (value) {
                        bool isChecked = value ?? _autoHideScaleBar;
                        _kakaoMap?.setAutoHide(isChecked);
                        setState(() => _autoHideScaleBar = isChecked);
                      },
                    )
                  ),
                ],
              ),
              const Text("Compass: ", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
              Row(
                children: <Widget>[
                  Expanded(child:
                    CheckboxListTile(
                      title: const Text("Show/Hide"),
                      value: _showCompass,
                      onChanged: (value) {
                        bool isChecked = value ?? _showCompass;
                        if (isChecked) {
                          _kakaoMap?.showCompass();
                        } else {
                          _kakaoMap?.hideCompass();
                        }
                        setState(() => _showCompass = isChecked);
                      },
                    )
                  ),
                  Expanded(child:
                    CheckboxListTile(
                      title: const Text("BackToNorthOnClick"),
                      value: _backToNorthOnClick,
                      onChanged: (value) {
                        bool isChecked = value ?? _backToNorthOnClick;
                        _kakaoMap?.setBackToNorthOnClick(isChecked);
                        setState(() => _backToNorthOnClick = isChecked);
                      },
                    )
                  ),
                ],
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
                  onMapReady: (kakaoMap) {
                    _kakaoMap = kakaoMap;

                    // Set compass, scalebar
                    if (_showCompass) {
                      kakaoMap.showCompass();
                    }
                    if (_showScaleBar) {
                      kakaoMap.showScaleBar();
                    }
                    kakaoMap.setAutoHide(_autoHideScaleBar);
                    kakaoMap.setBackToNorthOnClick(_backToNorthOnClick);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}