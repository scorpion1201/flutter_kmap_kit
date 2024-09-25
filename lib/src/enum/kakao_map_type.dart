part of flutter_kmap_kit;

enum KakaoMapType {
  normal,
  skyview;

  @override
  String toString() {
    switch (this) {
      case KakaoMapType.normal:
        return "map";
      case KakaoMapType.skyview:
        return "skyview";
      default:
        throw Exception("KakaoMapType, No Matching Value ($this)");
    }
  }
}