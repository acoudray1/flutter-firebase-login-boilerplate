import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// [RootEvent] describes the different events that can happen on the app
abstract class RootEvent extends Equatable {
  const RootEvent();

  @override
  List<Object> get props => <Object>[];
}

/// Event : display an alert dialog
class ThrowAlertDialog extends RootEvent {
  const ThrowAlertDialog({
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
  String toString() => 'ThrowAlertDialog { title: $title, content: $content, actions: $actions }';
}

/// Event : display a simple informative dialog
class ThrowInformationDialog extends RootEvent {
  
  const ThrowInformationDialog({
    this.title,
    this.widgets,
  });

  final String title;
  final List<Widget> widgets;

  @override
  List<Object> get props => <Object>[title, widgets];

  @override
  String toString() => 'ThrowInformationDialog { title: $title, widgets: ${widgets.toList().toString()} }';
}

/// Event : displays a snackbar to inform that something occured
class ThrowError extends RootEvent {

  const ThrowError({
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
  String toString() => 'ThrowError { title: $title, message: $message, icon: $icon }';
}

/// State : displays a snackbar to inform the user 
class ThrowInformation extends RootEvent {

  const ThrowInformation({
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
  String toString() => 'ThrowInformation { title: $title, message: $message, icon: $icon }';
}