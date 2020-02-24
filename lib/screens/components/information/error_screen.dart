import 'package:flutter/material.dart';

/// [ErrorScreen] is the widget that is displayed at the start of the application
class ErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Error')),
    );
  }
}