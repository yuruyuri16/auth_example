// ignore_for_file: prefer_const_constructors
import 'package:app_api/app_api.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAppApiClient extends Mock implements AppApiClient {}

void main() {
  group('AuthenticationRepository', () {
    late AppApiClient apiClient;

    setUp(() {
      apiClient = MockAppApiClient();
    });
    test('can be instantiated', () {
      expect(AuthenticationRepository(apiClient: apiClient), isNotNull);
    });
  });
}
