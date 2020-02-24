import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:flutter_firebase_login_boilerplate/blocs/authentication/authentication_bloc.dart';
import 'package:flutter_firebase_login_boilerplate/blocs/authentication/authentication_events.dart';
import 'package:flutter_firebase_login_boilerplate/configuration/theme/custom_font_style.dart';

/// [_LoginData] represents the data required in order to login
class _LoginData {

  _LoginData({this.email, this.password});

  String email;
  String password;
}

/// [LoginPage] page displayed when the user wants to login
class LoginPage extends StatefulWidget {

  const LoginPage({Key key, this.fromSignupPage}) : super(key: key);

  final bool fromSignupPage;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final GlobalKey<FormState> _formLoginKey = GlobalKey<FormState>();
  final _LoginData _data = _LoginData();
  final RegExp emailReg = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final AuthenticationBloc authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);

    return Column(
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).padding.top,
        ),
        Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () => widget.fromSignupPage 
                ? authenticationBloc.add(const GoToSignup(fromLoginPage: false)) : authenticationBloc.add(ViewBack()),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text('Log In', style: CustomFontStyle.headerTextStyle),
            )
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height*0.1,
        ),
        Form(
          key: _formLoginKey,
          child: SizedBox(
            width: MediaQuery.of(context).size.width*0.85,
            child: Column(
              children: <Widget>[
                // Email section
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                  validator: (String value) {
                    if (value.trim().isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!emailReg.hasMatch(value.trim())) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  onSaved: (String email) => _data.email = email.trim(),
                ),
                // Password section
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    suffix: IconButton(
                      icon: _obscurePassword ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
                      onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                    ),
                  ),
                  obscureText: _obscurePassword,
                  validator: (String value) {
                    if (value.trim().isEmpty) {
                      return 'Please enter a password';
                    }
                    if (value.trim().length < 8) {
                      return 'The password must have at least 8 characters';
                    }
                    return null;
                  },
                  onSaved: (String password) => _data.password = password.trim(),
                ),
              ]
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height*0.1,
        ),
        GradientButton(
          child: const Text('Log In'),
          callback: () {
            if (_formLoginKey.currentState.validate()) {
              _formLoginKey.currentState.save();
              authenticationBloc.add(LoginButtonPressed(
                email: _data.email,
                password: _data.password,
              ));
            }
          },
          gradient: Gradients.rainbowBlue,
          shadowColor: Gradients.rainbowBlue.colors.last.withOpacity(0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0)
          ),
          elevation: 0.0,
          increaseHeightBy: MediaQuery.of(context).size.height*0.012,
          increaseWidthBy: MediaQuery.of(context).size.width*0.4,
        ),
        Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.025),
          child: SizedBox(
            height: MediaQuery.of(context).size.height*0.2,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                // go to sign up page
                Positioned(
                  top: 0.0,
                  height: MediaQuery.of(context).size.height*0.02,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Don\'t have an account ?', style: CustomFontStyle.commonTextStyle,),
                      FlatButton(
                        child: Text('Sign Up', style: CustomFontStyle.commonTextStyle.copyWith(
                          fontWeight: FontWeight.bold,
                        )),
                        onPressed: () => authenticationBloc.add(const GoToSignup(fromLoginPage: true)),
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                      ),
                      Text('or', style: CustomFontStyle.commonTextStyle,),
                    ],
                  ),
                ),
                // go to forgot password page
                Positioned(
                  top: MediaQuery.of(context).size.height*0.025,
                  height: MediaQuery.of(context).size.height*0.02,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Don\'t remember your password ?', style: CustomFontStyle.commonTextStyle,),
                      FlatButton(
                        child: Text('Reset Password', style: CustomFontStyle.commonTextStyle.copyWith(
                          fontWeight: FontWeight.bold,
                        )),
                        onPressed: () => authenticationBloc.add(GoToResetPassword()),
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                      ),
                    ],
                  ),
                ),
              ]
            ),
          ),
        ),
      ],
    );
  }
}