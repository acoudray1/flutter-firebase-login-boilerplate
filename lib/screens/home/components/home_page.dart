import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_login_boilerplate/blocs/application/root_bloc.dart';
import 'package:flutter_firebase_login_boilerplate/blocs/application/root_events.dart';
import 'package:flutter_firebase_login_boilerplate/blocs/home/home_bloc.dart';
import 'package:flutter_firebase_login_boilerplate/blocs/home/home_states.dart';
import 'package:flutter_firebase_login_boilerplate/configuration/theme/custom_font_style.dart';

/// [HomePage] entry point for home page's widgets
class HomePage extends StatelessWidget {

  const HomePage({Key key, this.index}) : super(key: key);
  
  final int index;
  
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (BuildContext context, HomeState state) {
        if (state is Failure) {
          BlocProvider.of<RootBloc>(context)
            .add(ThrowError(icon: Icons.error, title: 'An error occured', message: state.error));
        }
      },
      child: Center(
        child: Container(
          child: Text('$index', style: CustomFontStyle.headerTextStyle.copyWith(color: Colors.black),),
        ),
      ),
    );
  }
}