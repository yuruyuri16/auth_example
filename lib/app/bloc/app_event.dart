part of 'app_bloc.dart';

abstract class AppEvent {
  const AppEvent();
}

class AppUserChanged extends AppEvent {
  AppUserChanged(this.user);

  final User user;
}

class AppLogOutRequested extends AppEvent {}
