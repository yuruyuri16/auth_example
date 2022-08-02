import 'dart:async';

import 'package:app_api/app_api.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc(this._authenticationRepository)
      : super(
          _authenticationRepository.currentUser.isEmpty
              ? const AppState.unauthenticated()
              : AppState.authenticated(_authenticationRepository.currentUser),
        ) {
    on<AppUserChanged>(_onUserChanged);
    on<AppLogOutRequested>(_onLogOutRequested);
    _subscription = _authenticationRepository.user
        .listen((user) => add(AppUserChanged(user)));
  }

  late final StreamSubscription<User> _subscription;

  final AuthenticationRepository _authenticationRepository;

  void _onUserChanged(AppUserChanged event, Emitter<AppState> emit) {
    emit(
      event.user.isEmpty
          ? const AppState.unauthenticated()
          : AppState.authenticated(event.user),
    );
  }

  void _onLogOutRequested(AppLogOutRequested event, Emitter<AppState> emit) {
    _authenticationRepository.logOut().ignore();
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
