import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_login_boilerplate/blocs/application/application_events.dart';
import 'package:flutter_firebase_login_boilerplate/blocs/authentication/authentication_events.dart';
import 'package:flutter_firebase_login_boilerplate/blocs/authentication/authentication_states.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_firebase_login_boilerplate/blocs/application/application_bloc.dart';
import 'package:flutter_firebase_login_boilerplate/providers/repositories/user_repository.dart';

/// [AuthenticationBloc] links [LoginEvent] to [LoginState]
class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({@required this.applicationBloc}) : assert(applicationBloc != null);

  final UserRepository userRepository = UserRepository();
  final ApplicationBloc applicationBloc;

  @override
  AuthenticationState get initialState => Initial();

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) async* {
    /// Sends to [Login] state
    if (event is GoToLogin) {
      yield Login(fromSignupPage: event.fromSignupPage);
    }

    /// Login the user in firebase, if [FirebaseUser] adds [ApplicationBloc.LoggedIn] and sends state 
    /// back to [Initial]. Else if result is error.String sends [Failure] and [Login]. Else sends [EmailNotVerified].
    if (event is LoginButtonPressed) {
      final dynamic result = await userRepository.connectUser(event.email, event.password);

      if (result is FirebaseUser) {
        applicationBloc.add(LoggedIn());
        yield Initial();
      } else if (result is String) {
        yield Failure(error: result);
        yield Login();
      } else {
        yield EmailNotVerified();
      }
    }

    /// Sends to [Signup] state
    if (event is GoToSignup) {
      yield Signup(fromLoginPage: event.fromLoginPage);
    }

    /// Register the user in firebase and send email verification, if result is an error.String sends [Failure] and [Signup],
    /// else sends [EmailNotVerified].
    if (event is SignupButtonPressed) {
      final dynamic result = await userRepository.registerUser(event.email, event.password);

      if (result is String) {
        yield Failure(error: result);
        yield Signup();
      } else {
        yield EmailNotVerified();
      }
    }

    /// If the email is not verified sends [Failure] and [EmailNotVerified], else sends [ApplicationBloc.LoggedIn]
    /// and [Initial].
    if (event is EmailVerifiedButtonPressed) {
      final dynamic isEmailVerified = await userRepository.userVerified();

      if (isEmailVerified is bool && isEmailVerified) {
        applicationBloc.add(LoggedIn());
        yield Initial();
      } else {
        yield Failure(error: 'Your email is not verified');
        yield EmailNotVerified();
      }
    }

    /// Sends to [EmailNotVerified] state
    if (event is GotToEmailVerification) {
      yield EmailNotVerified();
    }

    /// Send a new email verification to the user
    if (event is SendEmailVerificationButtonPressed) {
      userRepository.sendEmailVerification();
    }

    /// Sends to [ResetPassword] state
    if (event is GoToResetPassword) {
      yield ResetPassword();
    }

    /// Sends an email to the user in order that he resets its password and then sends [ResetPasswordEmailSent] state
    if (event is ResetPasswordButtonPressed) {
      await userRepository.askForPasswordReset(event.email);
      yield ResetPasswordEmailSent();
      yield ResetPassword();
    }

    /// Sends to [Initial] state
    if (event is ViewBack) {
      yield Initial();
    }
  }
}