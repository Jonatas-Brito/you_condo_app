import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  late FirebaseFirestore firestore;

  initialiase() {
    firestore = FirebaseFirestore.instance;
  }

  Future<List> read() async {
    QuerySnapshot querySnapshot;
    List docs = [];
    try {
      querySnapshot = await firestore.collection("countries").get();
      if (querySnapshot.docs.isNotEmpty) {
        log("============================== LOG:  ==============================");

        for (var doc in querySnapshot.docs.toList()) {
          Map a = {"id": doc.id, "name": doc["name"], "code": doc["code"]};
          docs.add(a);
        }
      }
    } catch (e) {
      print(e);
    }
    return docs;
  }

  Future<List> create({
    required String name,
    required String code,
  }) async {
    List docs = [];
    try {
      await firestore.collection("countries").add({
        "name": name,
        "code": code,
        "timestamp": FieldValue.serverTimestamp()
      });
    } catch (e) {
      print(e);
    }
    return docs;
  }
}
