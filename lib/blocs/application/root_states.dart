import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// [RootState] describes the different states of the root
abstract class RootState extends Equatable {
  @override
  List<Object> get props => <Object>[];
}

/// State : Stable state
class Stable extends RootState {}

/// State : Displays an alert dialog
class DialogAlertDisplay extends RootState {
  DialogAlertDisplay({
    this.title,
    this.content,
    this.actions,
  });

  final String title;
  final String content;
  final List<Widget> actions;

  @override
  List<Object> get props => <Object>[title, content, actions];

  @override
  String toString() => 'DialogAlertDisplay { title: $title, content: $content, actions: ${actions.toList().toString()} }';
}

/// State : Displays a simple dialog with informations
class DialogInformationDisplay extends RootState {

  DialogInformationDisplay({
    this.title,
    this.widgets,
  });

  final String title;
  final List<Widget> widgets;

  @override
  List<Object> get props => <Object>[title, widgets];

  @override
  String toString() => 'DialogInformationDisplay { title: $title, widgets: ${widgets.toList().toString()} }';
}

/// State : Displays a simple snackbar with error informations
class ErrorDisplay extends RootState {

  ErrorDisplay({
    this.title,
    this.message,
    this.icon,
  });

  final String title;
  final String message;
  final IconData icon;

  @override
  List<Object> get props => <Object>[title, message, icon];

  @override
  String toString() => 'ErrorDisplay { title: $title, message: $message, icon: $icon }';
}

/// State : Displays a snackbar with informations
class InformationDisplay extends RootState {
  InformationDisplay({
    this.title,
    this.message,
    this.icon,
  });

  final String title;
  final String message;
  final IconData icon;

  @override
  List<Object> get props => <Object>[title, message, icon];

  @override
  String toString() => 'InformationDisplay { title: $title, message: $message, icon: $icon }';
}

/// State : Change the current theme
class ThemeTrigger extends RootState {}