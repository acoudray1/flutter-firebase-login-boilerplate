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
    /// back to [Initial]. Else sends [Failure] and [Login].
    if (event is LoginButtonPressed) {
      final dynamic result = await userRepository.connectUser(event.email, event.password);

      if (result is FirebaseUser) {
        applicationBloc.add(LoggedIn());
        yield Initial();
      } else {
        yield Failure(error: result);
        yield Login();
      }
    }

    /// Sends to [Signup] state
    if (event is GoToSignup) {
      yield Signup(fromLoginPage: event.fromLoginPage);
    }

    /// Register the user in firebase, if [FirebaseUser] adds [ApplicationBloc.LoggedIn] and sends state 
    /// back to [Initial]. Else sends [Failure] and [Signup].
    if (event is SignupButtonPressed) {
      final dynamic result = await userRepository.registerUser(event.email, event.password);

      if (result is FirebaseUser) {
        applicationBloc.add(LoggedIn());
        yield Initial();
      } else {
        yield Failure(error: result);
        yield Signup();
      }
    }

    /// Sends to [ResetPassword] state
    if (event is GoToResetPassword) {
      yield ResetPassword();
    }

    /// Sends to [Initial] state
    if (event is ViewBack) {
      yield Initial();
    }
  }
}