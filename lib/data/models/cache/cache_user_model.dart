import 'package:hive/hive.dart';

part 'cache_user_model.g.dart';

@HiveType(typeId: 0)
class CacheUserModel  {
  @HiveField(0)
  String? accessToken;

  @HiveField(1)
  String? refreshToken;

  @HiveField(2)
  int? id;

  @HiveField(3)
  String? username;

  @HiveField(4)
  String? email;

  @HiveField(5)
  String? firstName;

  @HiveField(6)
  String? lastName;

  @HiveField(7)
  String? gender;

  @HiveField(8)
  String? image;

  @HiveField(9)
  String? message;

  CacheUserModel({
    this.accessToken,
    this.refreshToken,
    this.id,
    this.username,
    this.email,
    this.firstName,
    this.lastName,
    this.gender,
    this.message,
    this.image,
  });

  factory CacheUserModel.fromJson(Map<String, dynamic> json) {
    return CacheUserModel(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
      id: json['id'],
      username: json['username'],
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      gender: json['gender'],
      image: json['image'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'id': id,
      'username': username,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'gender': gender,
      'image': image,
      'message': message,
    };
  }
}
