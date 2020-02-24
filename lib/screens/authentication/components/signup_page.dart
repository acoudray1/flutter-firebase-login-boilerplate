import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:flutter_firebase_login_boilerplate/blocs/authentication/authentication_bloc.dart';
import 'package:flutter_firebase_login_boilerplate/blocs/authentication/authentication_events.dart';
import 'package:flutter_firebase_login_boilerplate/configuration/theme/custom_font_style.dart';

/// [_SignupData] represents the data required to signup
class _SignupData {

  _SignupData({this.username, this.email, this.password});

  String username;
  String email;
  String password;
}

/// [SignupPage] page displayed when the user wants to signup
class SignupPage extends StatefulWidget {

  const SignupPage({Key key, this.fromLoginPage}) : super(key: key);

  final bool fromLoginPage;

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  final GlobalKey<FormState> _formLoginKey = GlobalKey<FormState>();
  final _SignupData _data = _SignupData();
  final RegExp usernameReg = RegExp(r'^[a-zA-Z0-9]+$');
  final RegExp emailReg = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  bool _obscurePassword = true;
  String _currentPassword;

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
              onPressed: () => widget.fromLoginPage 
                ? authenticationBloc.add(const GoToLogin(fromSignupPage: false)) : authenticationBloc.add(ViewBack()),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text('Sign Up', style: CustomFontStyle.headerTextStyle),
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
                // Username section
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Username',
                  ),
                  validator: (String value) {
                    if (value.trim().isEmpty) {
                      return 'Please enter a username';
                    }
                    if (!usernameReg.hasMatch(value.trim())) {
                      return 'Please enter a valid username (no special character allowed)';
                    }
                    return null;
                  },
                  onSaved: (String username) => _data.username = username.trim(),
                ),
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
                  onChanged: (String value) => _currentPassword = value,
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
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Confirm your password',
                    suffix: IconButton(
                      icon: _obscurePassword ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
                      onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                    ),
                  ),
                  obscureText: _obscurePassword,
                  validator: (String value) {
                    if (value.trim() != _currentPassword) {
                      return 'The password is not the same';
                    }
                    return null;
                  },
                ),
              ]
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height*0.1,
        ),
        GradientButton(
          child: const Text('Sign Up'),
          callback: () {
            if (_formLoginKey.currentState.validate()) {
              _formLoginKey.currentState.save();
              authenticationBloc.add(SignupButtonPressed(
                username: _data.username,
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
        // go to sign in page
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Already have an account ?', style: CustomFontStyle.commonTextStyle,),
            FlatButton(
              child: Text('Sign In', style: CustomFontStyle.commonTextStyle.copyWith(
                fontWeight: FontWeight.bold,
              )),
              onPressed: () => authenticationBloc.add(const GoToLogin(fromSignupPage: true)),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
          ],
        ),
      ],
    );
  }
}