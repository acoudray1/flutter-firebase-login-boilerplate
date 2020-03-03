import 'package:bloc/bloc.dart';
import 'package:flutter_firebase_login_boilerplate/blocs/application/application_events.dart';
import 'package:flutter_firebase_login_boilerplate/blocs/application/application_states.dart';
import 'package:flutter_firebase_login_boilerplate/providers/repositories/user_repository.dart';

/// [ApplicationBloc] links [ApplicationEvent] to [ApplicationState]
class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  final UserRepository userRepository = UserRepository();

  @override
  ApplicationState get initialState => ApplicationUninitialized();

  @override
  Stream<ApplicationState> mapEventToState(ApplicationEvent event) async* {
    /// Checks if a user is already logged in and if its email is verified, then sends to [LoggedIn] 
    /// state, if not it adds [UserUnauthenticated].
    if (event is AppStarted) {
      yield Loading();
      final dynamic isUserVerified = await userRepository.userVerified();
      final bool userExists = await userRepository.checkUserState();

      if (isUserVerified is bool) {
        if (userExists && isUserVerified) {
          add(LoggedIn());
        } else if (userExists && !isUserVerified) {
          yield UserUnauthenticated(userMustVerifyEmail: true);
        }
      } else {
        yield UserUnauthenticated(userMustVerifyEmail: false);
      }
    }

    /// Sends to [UserAuthenticated] state
    if (event is LoggedIn) {
      // TODO(axelc): Add a get user here
      yield UserAuthenticated();
    }

    /// Sends to [LoginBloc.UserUnauthenticated] state and disconnects the user from the app.
    /// Adds [AppStarted] to restart using it
    if (event is LoggedOut) {
      yield UserUnauthenticated(userMustVerifyEmail: false);
      await userRepository.disconnectUser();
      add(AppStarted());
    }
  }
}