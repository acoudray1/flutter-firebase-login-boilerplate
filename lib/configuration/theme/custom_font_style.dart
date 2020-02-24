import 'package:flutter/material.dart';

class CustomFontStyle {
  CustomFontStyle._();

  // Roboto Style - Header & Title
  static const TextStyle robotoBaseTextStyle = TextStyle(
    fontFamily: 'Roboto'
  );
  
  static final TextStyle headerTextStyle = robotoBaseTextStyle.copyWith(
    fontSize: 40.0,
    fontWeight: FontWeight.bold
  );
  static final TextStyle titleTextStyle = robotoBaseTextStyle.copyWith(
    fontSize: 22.0,
    fontWeight: FontWeight.w600
  );
  static final TextStyle secondTitleTextStyle = robotoBaseTextStyle.copyWith(
    fontSize: 19.0,
    fontWeight: FontWeight.w400
  );
  static final TextStyle subtitleTextStyle = robotoBaseTextStyle.copyWith(
    fontSize: 16.0,
    fontWeight: FontWeight.w400
  );
  static final TextStyle commonTextStyle = robotoBaseTextStyle.copyWith(
    fontSize: 14.0,
    fontWeight: FontWeight.w400
  );
  static final TextStyle smallTextStyle = robotoBaseTextStyle.copyWith(
    fontSize: 12.0,
    fontWeight: FontWeight.w400
  );
}