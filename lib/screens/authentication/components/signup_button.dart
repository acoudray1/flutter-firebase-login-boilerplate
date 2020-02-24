import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_login_boilerplate/blocs/authentication/authentication_bloc.dart';
import 'package:flutter_firebase_login_boilerplate/blocs/authentication/authentication_events.dart';

/// [SignupButton] sign up button's widget
class SignupButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: const Text('Sign Up'),
      onPressed: () => BlocProvider.of<AuthenticationBloc>(context).add(const GoToSignup()),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0)
      ),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
    );
  }
}