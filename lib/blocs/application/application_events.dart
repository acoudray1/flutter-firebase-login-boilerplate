import 'package:equatable/equatable.dart';

/// [ApplicationEvent] describes the different events that can happen during Application
abstract class ApplicationEvent extends Equatable {
  const ApplicationEvent();

  @override
  List<Object> get props => <Object>[];
}

/// Event : The app is started
class AppStarted extends ApplicationEvent {}

/// Event : The user is logged in
class LoggedIn extends ApplicationEvent {}

/// Event : The user is logged out
class LoggedOut extends ApplicationEvent {}