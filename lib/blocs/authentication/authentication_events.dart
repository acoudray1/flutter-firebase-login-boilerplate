import 'package:equatable/equatable.dart';

/// [AuthenticationEvent] describes the different events that happens on the auth page
abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => <Object>[];
}

/// Event : The user wants to login
class GoToLogin extends AuthenticationEvent {
  const GoToLogin({this.fromSignupPage = false});

  final bool fromSignupPage;

  @override
  List<Object> get props => <Object>[fromSignupPage];

  @override
  String toString() => 'GoToLogin { fromSignupPage: ${fromSignupPage.toString()} }';
}

/// Event : A button is pressed to login
class LoginButtonPressed extends AuthenticationEvent {
  const LoginButtonPressed({this.email, this.password});

  final String email;
  final String password;

  @override
  List<Object> get props => <Object>[email, password];

  @override
  String toString() => 'LoginButtonPressed { email: $email, password size: ${password.length} }';
}

/// Event : A button is pressed to sign up
class SignupButtonPressed extends AuthenticationEvent {
  const SignupButtonPressed({this.username, this.email, this.password});

  final String username;
  final String email;
  final String password;

  @override
  List<Object> get props => <Object>[email, password];

  @override
  String toString() => 'SignupButtonPressed { email: $email, password size: ${password.length} }';
}

/// Event : The user wants to signup
class GoToSignup extends AuthenticationEvent {
  const GoToSignup({this.fromLoginPage = false});

  final bool fromLoginPage;

  @override
  List<Object> get props => <Object>[fromLoginPage];

  @override
  String toString() => 'GoToSignup { fromLoginPage: ${fromLoginPage.toString()} }';
}

/// Event : A button is pressed to change user's password
class ResetPasswordButtonPressed extends AuthenticationEvent {
  const ResetPasswordButtonPressed({this.email});

  final String email;

  @override
  List<Object> get props => <Object>[email];

  @override
  String toString() => 'ResetPasswordButtonPressed { email: $email }';
}

/// Event : The user wants to rest its password
class GoToResetPassword extends AuthenticationEvent {}

/// Event : The email verified button is pressed
class EmailVerifiedButtonPressed extends AuthenticationEvent {}

/// Event : Send a new email to the user
class SendEmailVerificationButtonPressed extends AuthenticationEvent {}

/// Event : The login or signup view is closed without auth
class ViewBack extends AuthenticationEvent {}
