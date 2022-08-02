import 'package:app_api/app_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fresh_dio/fresh_dio.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// {@template app_api}
/// An API example
/// {@endtemplate}
class AppApiClient {
  /// {@macro app_api}
  AppApiClient()
      : _httpClient = Dio()
          ..options.baseUrl = _baseUrl
          ..interceptors.add(_fresh)
          ..interceptors.add(LogInterceptor());

  static final _fresh = Fresh.oAuth2(
    tokenStorage: InMemoryTokenStorage<OAuth2Token>(),
    refreshToken: (token, httpClient) async => throw RevokeTokenException(),
  );

  static const _baseUrl = 'http://0.0.0.0:8080';
  static const _userKey = 'user';
  // ignore: unused_field
  final Dio _httpClient;

  /// Hive user box to persist data
  late final Box<User> userBox;

  /// Watch all changes to the user stored
  Stream<User> get user => userBox.watch().map((event) {
        debugPrint('event value: ${event.value ?? 'null'}');
        return event.value as User;
      });

  /// Gets the user stored in the Hive box
  User get currentUser {
    debugPrint('currentUser: ${userBox.get(_userKey) ?? 'null'}');
    return userBox.get(_userKey) ?? User.empty;
  }

  ///
  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter<User>(UserAdapter());
    userBox = await Hive.openBox(_userKey);
  }

  /// Login with [email] and [password]
  Future<void> login(String email, String password) async {
    try {
      final user = await Future.delayed(
        const Duration(seconds: 1),
        () => User('test name', email),
      );
      await userBox.put(_userKey, user);
      await _fresh
          .setToken(const OAuth2Token(accessToken: 'a very good token'));
    } catch (_) {}
  }

  ///
  Future<void> logOut() async {
    await userBox.put(_userKey, User.empty);
    await _fresh.clearToken();
  }
}
