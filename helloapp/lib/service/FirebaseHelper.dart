import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:helloapp/model/user_model.dart';

class FireBaseHelper {
  static Future<UserModal?> getLoggedInUser(String uid) async {
    UserModal? userModal;

    DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection("users").doc(uid).get();

    if (snapshot.exists) {
      userModal = UserModal.fromMap(snapshot.data()!);
    }

    return userModal;
  }
}
