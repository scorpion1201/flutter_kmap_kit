part of flutter_kmap_kit;

enum MapOverlay {
  roadViewLine('roadview_line'),
  hillShading('hill_shading'),
  bicycleRoad('bicycle_road'),
  skyView('hybrid');

  final String value;

  const MapOverlay(this.value);

  String getValue() {
    return value;
  }

  static MapOverlay getEnum(String value) {
    if (value == MapOverlay.roadViewLine.getValue()) {
      return MapOverlay.roadViewLine;
    } else if (value == MapOverlay.hillShading.getValue()) {
      return MapOverlay.hillShading;
    } else if (value == MapOverlay.bicycleRoad.getValue()) {
      return MapOverlay.bicycleRoad;
    } else if (value == MapOverlay.skyView.getValue()) {
      return MapOverlay.skyView;
    } else {
      throw ArgumentError('MapOverlay, No Matching Value($value)');
    }
  }
}