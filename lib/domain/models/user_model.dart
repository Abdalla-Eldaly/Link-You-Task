

class User  {
  String? accessToken;
  String? refreshToken;
  int? id;
  String? username;
  String? email;
  String? firstName;
  String? lastName;
  String? gender;
  String? image;
  String? message;

  User ({
    this.accessToken,
    this.refreshToken,
    this.id,
    this.username,
    this.email,
    this.firstName,
    this.lastName,
    this.gender,
    this.message,
    this.image,});

  User.fromJson(dynamic json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    id = json['id'];
    username = json['username'];
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    gender = json['gender'];
    image = json['image'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['accessToken'] = accessToken;
    map['refreshToken'] = refreshToken;
    map['id'] = id;
    map['username'] = username;
    map['email'] = email;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['gender'] = gender;
    map['image'] = image;
    map['message'] = message;
    return map;
  }

}