import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  static final auth = FirebaseAuth.instance;
  static User? get currentUser => auth.currentUser;
  static Future<void> SignOut() async {
    await auth.signOut();
  }
}
