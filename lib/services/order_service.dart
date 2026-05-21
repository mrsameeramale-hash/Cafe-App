import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OrderService {

  final FirebaseFirestore firestore =
      FirebaseFirestore.instance;

  final FirebaseAuth auth =
      FirebaseAuth.instance;

  // Save Order
  Future<void> saveOrder({

    required String foodName,
    required String price,
    required int quantity,

  }) async {

    final user = auth.currentUser;

    if (user == null) return;

    await firestore
        .collection("users")
        .doc(user.uid)
        .collection("orders")
        .add({

      "foodName": foodName,
      "price": price,
      "quantity": quantity,
      "date": DateTime.now(),

    });
  }
}