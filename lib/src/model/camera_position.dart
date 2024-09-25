part of flutter_kmap_kit;

class CameraPosition {
  final LatLng position;
  final int zoomLevel;
  final double tiltAngle;
  final double rotationAngle;

  CameraPosition({
    required this.position,
    required this.zoomLevel,
    required this.tiltAngle,
    required this.rotationAngle,
  });

  @override
  String toString() {
    return 'CameraPosition{position: $position, zoomLevel: $zoomLevel, tiltAngle: $tiltAngle, rotationAngle: $rotationAngle}';
  }
}