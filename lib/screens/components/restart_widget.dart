import 'package:flutter/material.dart';

/// [RestartWidget] allows the complete restart of the app
class RestartWidget extends StatefulWidget {
  const RestartWidget({this.child});

  final Widget child;

  static void restartApp(BuildContext context) {
    final _RestartWidgetState state =
        context.findAncestorStateOfType<_RestartWidgetState>();
    state.restartApp();
  }

  @override
  _RestartWidgetState createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      child: widget.child,
    );
  }
}