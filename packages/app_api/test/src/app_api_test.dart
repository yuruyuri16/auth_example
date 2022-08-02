// ignore_for_file: prefer_const_constructors
import 'package:app_api/app_api.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppApi', () {
    test('can be instantiated', () {
      expect(AppApiClient(), isNotNull);
    });
  });
}
