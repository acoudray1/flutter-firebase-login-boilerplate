/// [User] defines a user
class User {
  User({
    this.id,
    this.fullName,
    this.userName,
    this.email,
    this.gender,
    this.registrationDate,
  });

  /// Factory [fromJson] used to create a user from a json file
  ///
  /// @params json (Map<String, dynamic>)
  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'],
    fullName: json['full_name'],
    userName: json['user_name'],
    email: json['email'],
    gender: json['gender'],
    registrationDate: DateTime.fromMillisecondsSinceEpoch(2000000 * 1000),
  );

  /// [toJson] maps string and data in order to write in a json file
  ///
  /// @return json (Map<String, dynamic>)
  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'full_name': fullName,
    'user_name': userName,
    'email': email,
    'gender': gender,
    'registration_date': registrationDate.millisecondsSinceEpoch * 0.0001,
  };

  String id;
  String fullName;
  String userName;
  String email;
  int gender; // 0 : not known ; 1 : male ; 2 : female ; 9 : not applicable
  DateTime registrationDate;

  @override
  String toString() {
    return '''
      User { id: $id, fullName: $fullName, userName: $userName, email: $email, 
        gender: $gender, registrationDate: ${registrationDate.toString()} }
    ''';
  }
}