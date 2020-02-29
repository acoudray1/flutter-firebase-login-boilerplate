import 'package:bloc/bloc.dart';
import 'package:flutter_firebase_login_boilerplate/blocs/application/root_events.dart';
import 'package:flutter_firebase_login_boilerplate/blocs/application/root_states.dart';

/// [RootBloc] links [RootEvent] to [RootState]
class RootBloc extends Bloc<RootEvent, RootState> {
  @override
  RootState get initialState => Stable();

  @override
  Stream<RootState> mapEventToState(RootEvent event) async* {
    /// Sends [DialogAlertDisplay] state in order to display an alert dialog and then sends back to
    /// [Stable] state
    if (event is ThrowAlertDialog) {
      yield DialogAlertDisplay(title: event.title, content: event.content, actions: event.actions);
      yield Stable();
    }

    /// Sends [DialogInformationDisplay] state in order to display a simple dialog and then sends back to
    /// [Stable] state
    if (event is ThrowInformationDialog) {
      yield DialogInformationDisplay(title: event.title, widgets: event.widgets);
      yield Stable();
    }

    /// Sends [ErrorDisplay] state in order to display a snackbar and then sends back to
    /// [Stable] state
    if (event is ThrowError) {
      yield ErrorDisplay(title: event.title, message: event.message, icon: event.icon);
      yield Stable();
    }

    /// Sends [InformationDisplay] state in order to display a snackbar and then sends back to
    /// [Stable] state
    if (event is ThrowInformation) {
      yield InformationDisplay(title: event.title, message: event.message, icon: event.icon);
      yield Stable();
    }

    /// Sends [ThemeTrigger] state in order to change the current theme and then sends back to 
    /// [Stable] state
    if (event is ChangeTheme) {
      yield ThemeTrigger();
      yield Stable();
    }
  }
}