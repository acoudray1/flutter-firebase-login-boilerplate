import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_firebase_login_boilerplate/providers/services/abstract_firebase_api.dart';

/// [FirebaseAPI] service that calls firebase
class FirebaseAPI implements AbstractFirebaseAPI {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  /// [signIn] signs in a user
  @override
  Future<dynamic> signIn(String email, String password) async {
    AuthResult result;
    FirebaseUser user;
    String error;

    try {
      result = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      user = result.user;
    } on PlatformException catch (e) {
      error = e.message;
    }
    
    return user != null ? user : error;
  }

  /// [signUp] register a new user
  @override
  Future<dynamic> signUp(String email, String password) async {
    AuthResult result;
    FirebaseUser user;
    String error;

    try {
      result = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      user = result.user;
    } on PlatformException catch (e) {
      error = e.message;
    }

    return user != null ? user : error;
  }

  /// [getCurrentUser] returns a [FirebaseUser]
  @override
  Future<FirebaseUser> getCurrentUser() async {
    final FirebaseUser user = await _firebaseAuth.currentUser();
    return user;
  }

  /// [sendEmailVerification] sends an email to verify the user's identity
  @override
  Future<void> sendEmailVerification() async {
    final FirebaseUser user = await _firebaseAuth.currentUser();
    user.sendEmailVerification();
  }
  
  /// [signOut] signs out the user
  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  /// [isEmailVerified] verifies that the user's mail is valid
  @override
  Future<dynamic> isEmailVerified() async {
    final FirebaseUser user = await _firebaseAuth.currentUser();
    dynamic ret = '';

    if (user is FirebaseUser) {
      await user.reload();
      ret = user.isEmailVerified;
    }
    
    return ret;
  }

  /// [forgotPassword] sends an email to the user to change its password
  @override
  Future<void> forgotPassword(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }
}