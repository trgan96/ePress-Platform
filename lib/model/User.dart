class User {
  String _userId = "";
  String _token = "";

  User(this._userId, this._token);
  void setData(User user) {
    this._userId = user.userId;
    this._token = user.token;
  }

  String get token => _token;

  set token(String value) {
    _token = value;
  }

  String get userId => _userId;

  set userId(String value) {
    _userId = value;
  }

  factory User.fromJson(Map<String, dynamic> parsedJson) {
    if (parsedJson.isNotEmpty) {
      return new User(parsedJson["userId"] ?? "", parsedJson["token"] ?? "");
    }
    return User("", "");
  }

  String toJson() {
    return "{\"userId\":\"$_userId\", \"token\":\"$_token\"}";
  }

  bool unknow() {
    return _userId.isEmpty;
  }

  void clear() {
    _userId = "";
    _token = "";
  }
}
