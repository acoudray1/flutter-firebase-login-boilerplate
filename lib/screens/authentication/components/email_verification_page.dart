import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:flutter_firebase_login_boilerplate/blocs/authentication/authentication_bloc.dart';
import 'package:flutter_firebase_login_boilerplate/blocs/authentication/authentication_events.dart';
import 'package:flutter_firebase_login_boilerplate/configuration/theme/custom_font_style.dart';

class EmailVerificationPage extends StatelessWidget {

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
              onPressed: () => authenticationBloc.add(ViewBack()),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height*0.3,
        ),
        Text('Your email must be verified before continuing...', style: CustomFontStyle.commonTextStyle.copyWith(
          color: Colors.grey,
        )),
        SizedBox(
          height: MediaQuery.of(context).size.height*0.2,
        ),
        GradientButton(
          child: const Text('Email Verified!'),
          callback: () => authenticationBloc.add(EmailVerifiedButtonPressed()),
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
                Positioned(
                  top: 0.0,
                  height: MediaQuery.of(context).size.height*0.02,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Didn\'t received the email ?', style: CustomFontStyle.commonTextStyle,),
                      FlatButton(
                        child: Text('Send new email', style: CustomFontStyle.commonTextStyle.copyWith(
                          fontWeight: FontWeight.bold,
                        )),
                        onPressed: () => authenticationBloc.add(SendEmailVerificationButtonPressed()),
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}