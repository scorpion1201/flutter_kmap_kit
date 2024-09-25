part of flutter_kmap_kit;

class KMapKit {
  static Future<void> initKakaoMap(String apiKey) async {
    await KMapKitPlatform.instance.initKakaoMap(apiKey);
  }
}