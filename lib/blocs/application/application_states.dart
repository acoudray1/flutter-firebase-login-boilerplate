import 'package:equatable/equatable.dart';

/// [ApplicationState] describes the different states of the Application
abstract class ApplicationState extends Equatable {
  @override
  List<Object> get props => <Object>[];
}

/// State : No Application initialized
class ApplicationUninitialized extends ApplicationState {}

/// State : User has sessionID
class UserAuthenticated extends ApplicationState {}

/// State : User has no sessionID
class UserUnauthenticated extends ApplicationState {}

/// State : Checking if the sessionID is correct
class Loading extends ApplicationState {}

/// State : Failure while getting the user at start
class Failure extends ApplicationState {
  Failure({this.error});

  final String error;

  @override
  List<Object> get props => <Object>[error];

  @override
  String toString() => 'Failure { error: ${error ?? ''} }';
}