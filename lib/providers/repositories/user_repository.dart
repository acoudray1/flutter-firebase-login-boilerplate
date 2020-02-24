import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_login_boilerplate/models/classes/user.dart';
import 'package:flutter_firebase_login_boilerplate/providers/services/firebase_api.dart';

/// [UserRepository] is the user manager
class UserRepository {
  factory UserRepository() => _singleton;

  UserRepository._internal();

  static final UserRepository _singleton = UserRepository._internal();

  final FirebaseAPI firebaseAPI = FirebaseAPI();
  final User _userState = User();
  FirebaseUser _firebaseUser;

  User get userCurrentState => _userState;

  /// [checkUserState] checks if the user is already signed in
  Future<bool> checkUserState() async {
    _firebaseUser = await firebaseAPI.getCurrentUser();
    bool result = false;

    if (_firebaseUser != null) {
      _userState.id = _firebaseUser.uid;
      result = true;
    }

    return result;
  }

  /// [connectUser] handles the signin method
  Future<dynamic> connectUser(String email, String password) async {
    final dynamic signinResult = await firebaseAPI.signIn(email, password);

    return signinResult;
  }

  /// [registerUser] handles the signup method
  Future<dynamic> registerUser(String email, String password) async {
    final dynamic signupResult = await firebaseAPI.signUp(email, password);

    return signupResult;
  }

  /// [disconnectUser] signs out the user from the app
  Future<void> disconnectUser() async {
    firebaseAPI.signOut();
  }

  @override
  String toString() {
    return 'UserRepository { userState: ${_userState.toString()}}';
  }
}