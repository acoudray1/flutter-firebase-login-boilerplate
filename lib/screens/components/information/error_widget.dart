import 'package:flutter/material.dart';

/// [ErrorWidget] displayed when we are waiting for something
class ErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.width*0.3,
        width: MediaQuery.of(context).size.width*0.3,
        child: const Icon(Icons.error),
      ),
    );
  }
}