import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:flutter_firebase_login_boilerplate/blocs/authentication/authentication_bloc.dart';
import 'package:flutter_firebase_login_boilerplate/blocs/authentication/authentication_events.dart';
import 'package:flutter_firebase_login_boilerplate/configuration/properties/properties.dart';
import 'package:flutter_firebase_login_boilerplate/configuration/theme/custom_font_style.dart';
import 'package:flutter_firebase_login_boilerplate/screens/components/ctext_form_field.dart';

/// [ForgotPasswordPage] page displayed when user forgot its password
class ForgotPasswordPage extends StatelessWidget {

  final GlobalKey<FormState> _formLoginKey = GlobalKey<FormState>();
  final RegExp emailReg = properties['regexLabel']['email'];

  @override
  Widget build(BuildContext context) {
    final AuthenticationBloc authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    String _data = '';

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
        SizedBox(
          height: MediaQuery.of(context).size.height*0.2,
        ),
        Image.asset('assets/forgot_pwd.jpg', height: MediaQuery.of(context).size.height*0.2,),
        Center(child: Text('Forgot your password?', 
          style: CustomFontStyle.subtitleTextStyle.copyWith(fontWeight: FontWeight.bold),
        )),
        Center(child: Text('Enter your email below to receive your password reset instruction', 
          style: CustomFontStyle.commonTextStyle, textAlign: TextAlign.center, softWrap: true,
        )),
        SizedBox(
          height: MediaQuery.of(context).size.height*0.02,
        ),
        Form(
          key: _formLoginKey,
          child: SizedBox(
            width: MediaQuery.of(context).size.width*0.85,
            child: CTextFormField(
              isObscure: false,
              text: 'Email',
              validator: (String value) {
                if (value.trim().isEmpty) {
                  return 'Please enter your email';
                }
                if (!emailReg.hasMatch(value.trim())) {
                  return 'Please enter a valid email';
                }
                return null;
              },
              onSaved: (String email) => _data = email.trim(),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height*0.08,
        ),
        GradientButton(
          child: const Text('Send'),
          callback: () {
            if (_formLoginKey.currentState.validate()) {
              _formLoginKey.currentState.save();
              authenticationBloc.add(ResetPasswordButtonPressed(
                email: _data,
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
      ],
    );
  }
}