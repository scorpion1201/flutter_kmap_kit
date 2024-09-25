import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_kmap_kit/flutter_kmap_kit.dart';

void main() {
  test('KakaoMapGestureType', () {
    expect(KakaoMapGestureType.oneFingerDoubleTap.getValue(), 1);
    expect(KakaoMapGestureType.twoFingerSingleTap.getValue(), 2);
    expect(KakaoMapGestureType.pan.getValue(), 5);
    expect(KakaoMapGestureType.rotate.getValue(), 6);
    expect(KakaoMapGestureType.zoom.getValue(), 7);
    expect(KakaoMapGestureType.tilt.getValue(), 8);
    expect(KakaoMapGestureType.longTapAndDrag.getValue(), 9);
    expect(KakaoMapGestureType.rotateZoom.getValue(), 10);
    expect(KakaoMapGestureType.oneFingerZoom.getValue(), 11);
    expect(KakaoMapGestureType.unknown.getValue(), 17);
    expect(KakaoMapGestureType.getEnum(1), KakaoMapGestureType.oneFingerDoubleTap);
    expect(KakaoMapGestureType.getEnum(2), KakaoMapGestureType.twoFingerSingleTap);
    expect(KakaoMapGestureType.getEnum(5), KakaoMapGestureType.pan);
    expect(KakaoMapGestureType.getEnum(6), KakaoMapGestureType.rotate);
    expect(KakaoMapGestureType.getEnum(7), KakaoMapGestureType.zoom);
    expect(KakaoMapGestureType.getEnum(8), KakaoMapGestureType.tilt);
    expect(KakaoMapGestureType.getEnum(9), KakaoMapGestureType.longTapAndDrag);
    expect(KakaoMapGestureType.getEnum(10), KakaoMapGestureType.rotateZoom);
    expect(KakaoMapGestureType.getEnum(11), KakaoMapGestureType.oneFingerZoom);
    expect(KakaoMapGestureType.getEnum(17), KakaoMapGestureType.unknown);
  });
}
