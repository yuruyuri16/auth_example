import 'package:app_api/app_api.dart';
import 'package:auth_example/app/app.dart';
import 'package:auth_example/bootstrap.dart';
import 'package:authentication_repository/authentication_repository.dart';

void main() {
  bootstrap(() async {
    final apiClient = AppApiClient();
    await apiClient.init();
    final authenticationRepository =
        AuthenticationRepository(apiClient: apiClient);
    return App(authenticationRepository: authenticationRepository);
  });
}
