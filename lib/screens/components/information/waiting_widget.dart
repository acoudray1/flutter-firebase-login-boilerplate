import 'package:flutter/material.dart';

/// [WaitingWidget] displayed when we are waiting for something
class WaitingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.width*0.3,
        width: MediaQuery.of(context).size.width*0.3,
        child: const CircularProgressIndicator()
      ),
    );
  }
}