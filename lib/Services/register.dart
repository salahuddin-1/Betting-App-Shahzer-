import 'database.dart';
import '../model/registerAUserObj.dart';

class RegisterAUser {
  static Future<void> register(UserParameters userParameters) {
    return Database.usersRef.doc(userParameters.email).set({
      "email": userParameters.email,
      "password": userParameters.password,
      "username": userParameters.username,
    });
  }
}
