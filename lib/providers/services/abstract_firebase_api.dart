import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

/// [AbstractFirebaseAPI] is an abstract class that describes all the methods usable with firebase
abstract class AbstractFirebaseAPI {

  /// [signIn] signs in a user
  /// @return FirebaseUser | Error
  Future<dynamic> signIn(String email, String password);

  /// [signUp] register a new user
  /// @return FirebaseUser | Error
  Future<dynamic> signUp(String email, String password);

  /// [getCurrentUser] returns a [FirebaseUser]
  Future<FirebaseUser> getCurrentUser();

  /// [sendEmailVerification] sends an email to verify the user's identity
  Future<void> sendEmailVerification();

  /// [signOut] signs out the user
  Future<void> signOut();

  /// [isEmailVerified] verifies that the user's mail is valid
  Future<dynamic> isEmailVerified();

  /// [forgotPassword] sends an email to reset password
  Future<void> forgotPassword(String email);
}