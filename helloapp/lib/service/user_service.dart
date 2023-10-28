import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:helloapp/model/user_model.dart';

class UserService {
  static Future<UserModal> fetchLoggedInUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    UserModal loggedInUser = UserModal();

    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get();

    if (snapshot.exists) {
      loggedInUser = UserModal.fromMap(snapshot.data()!);
    }

    return loggedInUser;
  }
}
