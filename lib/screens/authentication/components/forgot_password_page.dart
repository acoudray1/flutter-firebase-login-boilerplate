import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_login_boilerplate/blocs/authentication/authentication_bloc.dart';
import 'package:flutter_firebase_login_boilerplate/blocs/authentication/authentication_events.dart';

/// [ForgotPasswordPage] page displayed when user forgot its password
class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).padding.top,
        ),
        Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () => BlocProvider.of<AuthenticationBloc>(context).add(const GoToLogin()),
            ),
          ],
        ),
      ],
    );
  }
}