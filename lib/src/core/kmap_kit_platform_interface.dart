part of flutter_kmap_kit;

abstract class KMapKitPlatform extends PlatformInterface {
  /// Constructs a KMapKitPlatform.
  KMapKitPlatform() : super(token: _token);

  static final Object _token = Object();

  static KMapKitPlatform _instance = MethodChannelKMapKit();

  /// The default instance of [KMapKitPlatform] to use.
  ///
  /// Defaults to [MethodChannelKMapKit].
  static KMapKitPlatform get instance => _instance;

  static set instance(KMapKitPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> initKakaoMap(String apiKey) {
    throw UnimplementedError('initKakaoMap() has not been implemented.');
  }
}