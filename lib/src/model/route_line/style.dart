part of '../../../flutter_kmap_kit.dart';

class RouteLineStyle {
  const RouteLineStyle({
    this.lineWidth = 0.0,
    this.lineColor = 0,
    this.strokeWidth = 0.0,
    this.strokeColor = 0,
    this.zoomLevel = 0,
    this.pattern,
  });

  final double lineWidth;
  final int lineColor;
  final double strokeWidth;
  final int strokeColor;
  final int zoomLevel;
  final RouteLinePattern? pattern;
}