part of flutter_kmap_kit;

/// An implementation of [KMapKitPlatform] that uses method channels.
class MethodChannelKMapKit extends KMapKitPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel(_channelName);

  @override
  Future<void> initKakaoMap(String apiKey) async {
    await methodChannel.invokeMethod<void>('initKakaoMap', [apiKey]);
  }
}