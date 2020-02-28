import 'package:equatable/equatable.dart';

/// [AuthenticationState] represents the different states of the auth with an application
abstract class AuthenticationState extends Equatable {
  @override
  List<Object> get props => <Object>[];
}

/// State : No process started
class Initial extends AuthenticationState {}

/// State : The user wants to login
class Login extends AuthenticationState {
  Login({this.fromSignupPage = false});

  final bool fromSignupPage;

  @override
  List<Object> get props => <Object>[fromSignupPage];

  @override
  String toString() => 'Login { fromSignupPage: ${fromSignupPage.toString()} }';
}

/// State : The user wants to signup
class Signup extends AuthenticationState {
  Signup({this.fromLoginPage = false});

  final bool fromLoginPage;

  @override
  List<Object> get props => <Object>[fromLoginPage];

  @override
  String toString() => 'Signup { fromLoginPage: ${fromLoginPage.toString()} }';
}

/// State : The user wants to reset its password
class ResetPassword extends AuthenticationState {}

/// State : The user must verify its email
class EmailNotVerified extends AuthenticationState {} 

/// State : An error has been thrown during loading
class Failure extends AuthenticationState {
  Failure({this.error = 'Something went wrong'});

  final String error;

  @override
  List<Object> get props => <Object>[error];

  @override
  String toString() => 'Failure { error: $error }';
}