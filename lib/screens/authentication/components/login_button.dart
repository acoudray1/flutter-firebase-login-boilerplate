import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:flutter_firebase_login_boilerplate/blocs/authentication/authentication_bloc.dart';
import 'package:flutter_firebase_login_boilerplate/blocs/authentication/authentication_events.dart';

/// [LoginButton] log in button's widget
class LoginButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GradientButton(
      child: const Text('Log In'),
      callback: () => BlocProvider.of<AuthenticationBloc>(context).add(const GoToLogin()),
      gradient: Gradients.rainbowBlue,
      shadowColor: Gradients.rainbowBlue.colors.last.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0)
      ),
      elevation: 0.0,
      increaseHeightBy: MediaQuery.of(context).size.height*0.012,
      increaseWidthBy: MediaQuery.of(context).size.width*0.4,
    );
  }
}