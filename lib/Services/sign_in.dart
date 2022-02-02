import 'package:cloud_firestore/cloud_firestore.dart';
import 'database.dart';
import '../model/registerAUserObj.dart';

class SignIn {
  static Future<DocumentSnapshot> signIN(String email) {
    return Database.usersRef.doc(email).get();
  }
}
