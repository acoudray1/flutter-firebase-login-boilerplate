import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_login_boilerplate/blocs/home/home_bloc.dart';
import 'package:flutter_firebase_login_boilerplate/screens/home/components/home_page.dart';

/// [Home] entry point for home page's bloc
class Home extends StatelessWidget {

  const Home({Key key, this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (BuildContext context) => HomeBloc(),
      child: HomePage(index: index,),
    );
  }
}