import 'package:flutter/material.dart';
import 'package:flutter_kmap_kit/flutter_kmap_kit.dart';

// Widget
part 'widget/checkbox_title.dart';

// Screen
part 'scene/home_screen.dart';
part 'scene/kakaomap/main_screen.dart';
part 'scene/kakaomap/demo_screen.dart';
part 'scene/kakaomap/map_start_screen.dart';
part 'scene/kakaomap/map_type_overlay_screen.dart';
part 'scene/kakaomap/point_to_latlng_screen.dart';
part 'scene/kakaomap/poi_screen.dart';
part 'scene/kakaomap/compase_scalebar_screen.dart';

// App
part 'app.dart';

void main() {
  runApp(const App());
}