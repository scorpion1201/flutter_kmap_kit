// This is a basic Flutter integration test.
//
// Since integration tests run in a full Flutter application, they can interact
// with the host side of a plugin implementation, unlike Dart unit tests.
//
// For more information about Flutter integration tests, please see
// https://flutter.dev/to/integration-testing


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:flutter_kmap_kit/flutter_kmap_kit.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("KakaoMapView initializes", (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: KakaoMapView(),
    ));
  });

  testWidgets('KakaoMapView creates AndroidView', (WidgetTester tester) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;

    await tester.pumpWidget(const MaterialApp(
      home: KakaoMapView(),
    ));

    expect(find.byType(AndroidView), findsOneWidget);

    debugDefaultTargetPlatformOverride = null;
  });

  testWidgets('KakaoMapView creates UiKitView', (WidgetTester tester) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

    await tester.pumpWidget(const MaterialApp(
      home: KakaoMapView(),
    ));

    expect(find.byType(UiKitView), findsOneWidget);

    debugDefaultTargetPlatformOverride = null;
  });

  testWidgets('KakaoMapView throws exception on unsupported platform', (WidgetTester tester) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;

    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: KakaoMapView(),
      ),
    ));

    expect(tester.takeException(), isInstanceOf<PlatformException>());

    debugDefaultTargetPlatformOverride = null;
  });
}
