import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth instance = FirebaseAuth.instance;

  Stream<User> get user {
    return instance.authStateChanges();
  }

  Future signOut() async {
    try {
      await instance.signOut();
    } catch (err) {
      print(err.toString());
    }
  }
}
