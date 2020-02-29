import 'package:flutter/material.dart';
import 'package:flutter_firebase_login_boilerplate/configuration/theme/custom_font_style.dart';

/// [CTextFormField] custom text form field
/// 
/// @param bool isObscure**
/// @param String text
/// @param String Function(String) validator
/// @param void Function(String) onSaved
/// @param void Function() onPressed**
/// @param bool obscurePassword
/// @param bool obscureText**
/// @param void Function(String) onChanged**
class CTextFormField extends StatelessWidget {

  const CTextFormField({
    Key key,
    @required this.isObscure,
    @required this.text,
    @required this.validator,
    this.onSaved,
    this.obscurePassword,
    this.onPressed,
    this.obscureText,
    this.onChanged,
  }) : assert(isObscure != null),
       assert(text != null),
       assert(validator != null),
       super(key: key);

  final bool isObscure;
  final String text;
  final String Function(String) validator;
  final void Function(String) onSaved;
  final void Function() onPressed;
  final bool obscurePassword;
  final bool obscureText;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.1,
      child: Theme(
        data: Theme.of(context).copyWith(splashColor: Colors.transparent),
        child: !isObscure ? TextFormField(
          autofocus: false,
          style: CustomFontStyle.commonTextStyle.copyWith(color: Colors.black87),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.black12.withOpacity(0.07),
            hintText: text,
            contentPadding: const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(9),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(9),
            ),
            // just to have the same size
            suffix: IconButton(icon: Icon(Icons.android, color: Colors.transparent,), onPressed: null,) 
          ),
          validator: validator,
          onSaved: onSaved,
        ) : TextFormField(
          autofocus: false,
          style: CustomFontStyle.commonTextStyle.copyWith(color: Colors.black87),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.black12.withOpacity(0.07),
            hintText: text,
            contentPadding: const EdgeInsets.all(8.0),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(9),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(9),
            ),
            suffix: IconButton(
              icon: obscurePassword ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
              onPressed: onPressed,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
          ),
          validator: validator,
          onSaved: onSaved,
          onChanged: onChanged,
          obscureText: obscureText,
        ),
      ),
    );
  }
}