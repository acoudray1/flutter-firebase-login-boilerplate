import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_login_boilerplate/blocs/application/application_bloc.dart';
import 'package:flutter_firebase_login_boilerplate/blocs/authentication/authentication_bloc.dart';
import 'package:flutter_firebase_login_boilerplate/screens/authentication/components/welcome_page.dart';

/// [Login] entry point for login page's bloc
class Authentication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<AuthenticationBloc>(
        create: (BuildContext context) => AuthenticationBloc(applicationBloc: BlocProvider.of<ApplicationBloc>(context)),
        child: WelcomePage(),
      ),
    );
  }
}