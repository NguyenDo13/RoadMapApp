
class User {
  String? sId;
  String? username;
  String? email;
  String? password;
  String? profile;
  int? iV;

  User(
      {this.sId,
      this.username,
      this.email,
      this.password,
      this.profile,
      this.iV});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    profile = json['profile'];
    iV = json['__v'];
  }
}