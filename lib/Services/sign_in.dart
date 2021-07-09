import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:news_app/Services/database.dart';
import 'package:news_app/model/registerAUserObj.dart';

class SignIn {
  
  static Future<DocumentSnapshot> signIN(String email) {
    return Database.usersRef.doc(email).get();
  }
}
