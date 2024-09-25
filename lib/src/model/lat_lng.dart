part of flutter_kmap_kit;

class LatLng {
  final double latitude;
  final double longitude;

  const LatLng({
    required this.latitude,
    required this.longitude,
  });

  Map<String, dynamic> toMap() {
    return {
      'lat': latitude,
      'lng': longitude,
    };
  }

  factory LatLng.fromMap(Map<String, dynamic> map) {
    return LatLng(
      latitude: map['lat'],
      longitude: map['lng'],
    );
  }
}