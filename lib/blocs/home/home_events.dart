import 'package:equatable/equatable.dart';

/// [HomeEvent] describes the different events that can happenon the match page
abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => <Object>[];
}

/// Event : The user picked a profilePic and needs to send the result
/* class SendMatchResult extends HomeEvent {
  const SendMatchResult({
    @required this.choice,
  }) : assert(choice != null);

  final int choice;

  @override
  List<Object> get props => <Object>[choice];

  @override
  String toString() => 'SendMatchResult { choice: $choice} }';
} */