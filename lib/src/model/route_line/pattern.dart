part of '../../../flutter_kmap_kit.dart';

class RouteLinePattern {
  const RouteLinePattern({
    this.points = const [],
    this.patternImage = "",
    this.symbolImage = "",
    this.distance = 0.0,
    this.pinStart = false,
    this.pinEnd = false,
  });

  final List<LatLng> points;
  final String patternImage;
  final String symbolImage;
  final double distance;
  final bool pinStart;
  final bool pinEnd;

  static RouteLinePattern from() {
    return const RouteLinePattern();
  }

  static RouteLinePattern fromPoints(List<LatLng> points) {
    return RouteLinePattern(points: points);
  }

  factory RouteLinePattern.fromMap(Map<String, dynamic> json) {
    return RouteLinePattern(
      points: json['points'] != null ? (json['points'] as List).map((e) => LatLng.fromMap(e)).toList() : [],
      patternImage: json['patternImage'] ?? "",
      symbolImage: json['symbolImage'] ?? "",
      distance: json['distance'] ?? 0.0,
      pinStart: json['pinStart'] ?? false,
      pinEnd: json['pinEnd'] ?? false,
    );
  }
}