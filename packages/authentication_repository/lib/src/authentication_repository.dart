import 'package:app_api/app_api.dart';

/// {@template authentication_repository}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class AuthenticationRepository {
  /// {@macro authentication_repository}
  const AuthenticationRepository({required AppApiClient apiClient})
      : _apiClient = apiClient;

  final AppApiClient _apiClient;

  ///
  Stream<User> get user => _apiClient.user;

  ///
  User get currentUser => _apiClient.currentUser;

  ///
  Future<void> login(String email, String password) async {
    await _apiClient.login(email, password);
  }

  ///
  Future<void> logOut() async {
    await _apiClient.logOut();
  }
}
