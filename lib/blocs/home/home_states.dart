import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

/// [HomeState] represents the different states of the match page
abstract class HomeState extends Equatable {
  @override
  List<Object> get props => <Object>[];
}

/// State : initial state
class InitialState extends HomeState {}

/// State : Something happenned while getting a match
class Failure extends HomeState {
  Failure({@required this.error});

  final String error;

  @override
  List<Object> get props => <Object>[error];

  @override
  String toString() => 'Failure { error: $error }';
}