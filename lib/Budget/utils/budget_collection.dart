import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BudgetCollection {
  static CollectionReference get tags {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw Exception('Not authenticated');
    }

    return FirebaseFirestore.instance
        .collection('usersData')
        .doc(user.uid)
        .collection('tags');
  }
}
