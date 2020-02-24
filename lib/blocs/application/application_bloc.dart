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
    /// Checks if a user is already logged in and then sends to [LoginBloc.UserUnauthenticated] state,
    /// if not it adds [LoggedIn]
    if (event is AppStarted) {
      yield UserUnauthenticated();
      if (await userRepository.checkUserState()) {
        add(LoggedIn());
      }
    }

    /// Sends to [UserAuthenticated] state
    if (event is LoggedIn) {
      yield UserAuthenticated();
    }

    /// Sends to [LoginBloc.UserUnauthenticated] state and disconnects the user from the app.
    /// Adds [AppStarted] to restart using it
    if (event is LoggedOut) {
      yield UserUnauthenticated();
      await userRepository.disconnectUser();
      add(AppStarted());
    }
  }
}