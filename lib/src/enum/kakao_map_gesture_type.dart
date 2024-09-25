part of flutter_kmap_kit;

enum KakaoMapGestureType {
  oneFingerDoubleTap(1),
  twoFingerSingleTap(2),
  pan(5),
  rotate(6),
  zoom(7),
  tilt(8),
  longTapAndDrag(9),
  rotateZoom(10),
  oneFingerZoom(11),
  unknown(17);

  final int value;

  const KakaoMapGestureType(this.value);

  int getValue() {
    return value;
  }

  static KakaoMapGestureType getEnum(int value) {
    for (KakaoMapGestureType type in KakaoMapGestureType.values) {
      if (type.value == value) {
        return type;
      }
    }
    return value == KakaoMapGestureType.oneFingerZoom.value ?
      KakaoMapGestureType.oneFingerZoom :
      KakaoMapGestureType.unknown;
  }
}