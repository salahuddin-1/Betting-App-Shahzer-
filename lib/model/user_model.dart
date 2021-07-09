import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String email;
  String password;
  String username;

  UserModel({
    this.email,
    this.password,
    this.username,
  });

  factory UserModel.fromJson(DocumentSnapshot doc) {
    return UserModel(
      email: doc['email'],
      password: doc['password'],
      username : doc['username'],
    );
  }
}
