part of flutter_kmap_kit;

class KakaoMapApiGateway {
  static final Map<int, KakaoMapApi> _instances = {};

  static KakaoMapApi getInstance(int id) {
    if (!_instances.containsKey(id)) {
      final KakaoMapApi instance = MethodChannelKakaoMapApi(id);
      _instances[id] = instance;

      /// when this dispose, remove this instance
      instance.onDispose = () {
        _instances.remove(id);
      };
    }
    return _instances[id]!;
  }
}