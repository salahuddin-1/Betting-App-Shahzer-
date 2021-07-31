import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:news_app/Services/database.dart';

class GetUsers {
  static Future<DocumentSnapshot> getRegisteredUser(String email) {
    return Database.usersRef.doc(email).get();
  }

  static Future<QuerySnapshot> getSameUsername(String userName) {
    return Database.usersRef.where("username", isEqualTo: userName).get();
  }
}
