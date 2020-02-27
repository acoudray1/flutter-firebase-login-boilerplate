import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_login_boilerplate/blocs/application/application_bloc.dart';
import 'package:flutter_firebase_login_boilerplate/blocs/application/application_events.dart';
import 'package:flutter_firebase_login_boilerplate/blocs/application/root_bloc.dart';
import 'package:flutter_firebase_login_boilerplate/blocs/application/root_events.dart';
import 'package:flutter_firebase_login_boilerplate/blocs/home/home_bloc.dart';
import 'package:flutter_firebase_login_boilerplate/blocs/home/home_states.dart';
import 'package:flutter_firebase_login_boilerplate/configuration/theme/custom_font_style.dart';
import 'package:flutter_firebase_login_boilerplate/configuration/theme/theme_notifier.dart';
import 'package:flutter_firebase_login_boilerplate/providers/repositories/shared_pref_calls.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:provider/provider.dart';


/// [HomePage] entry point for home page's widgets
class HomePage extends StatelessWidget {

  const HomePage({Key key, this.index}) : super(key: key);
  
  final int index;

  Future<void> _onThemeChanged(bool value, ThemeNotifier themeNotifier) async {
    value ? themeNotifier.setTheme(buildDarkTheme()) : themeNotifier.setTheme(buildLightTheme());
    SharedPrefCalls().setIsDarkMode(value);
  }
  
  @override
  Widget build(BuildContext context) {
    final ThemeNotifier themeNotifier = Provider.of<ThemeNotifier>(context);
    final bool isDarkMode = themeNotifier.isDarkMode();
    String themeText = 'Dark Theme';
    LinearGradient gradient = Gradients.byDesign;
    
    if (isDarkMode) {
      themeText = 'Light Theme';
      gradient = Gradients.rainbowBlue;
    }

    return BlocListener<HomeBloc, HomeState>(
      listener: (BuildContext context, HomeState state) {
        if (state is Failure) {
          BlocProvider.of<RootBloc>(context)
            .add(ThrowError(icon: Icons.error, title: 'An error occured', message: state.error));
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            child: Text('$index', style: CustomFontStyle.headerTextStyle.copyWith(color: Colors.black),),
          ),
          GradientButton(
            child: Text(themeText),
            callback: () => _onThemeChanged(!isDarkMode, themeNotifier),
            gradient: gradient,
            shadowColor: gradient.colors.last.withOpacity(0.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0)
            ),
            elevation: 0.0,
            increaseHeightBy: MediaQuery.of(context).size.height*0.012,
            increaseWidthBy: MediaQuery.of(context).size.width*0.4,
          ),
          GradientButton(
            child: const Text('Disconnect'),
            callback: () {
              BlocProvider.of<ApplicationBloc>(context).add(LoggedOut());
            },
            gradient: Gradients.cosmicFusion,
            shadowColor: Gradients.cosmicFusion.colors.last.withOpacity(0.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0)
            ),
            elevation: 0.0,
            increaseHeightBy: MediaQuery.of(context).size.height*0.012,
            increaseWidthBy: MediaQuery.of(context).size.width*0.4,
          ),
        ],
      ),
    );
  }
}
