/// [properties] config data for the application
Map<String, dynamic> properties = <String, dynamic>{
  'regexLabel': <String, dynamic>{
    'email': RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"),
    'username': RegExp(r'^[a-zA-Z0-9]+$'),
  }
};