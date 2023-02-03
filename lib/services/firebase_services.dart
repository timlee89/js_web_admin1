import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class FirebaseServices {
  User? user = FirebaseAuth.instance.currentUser;
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  CollectionReference meditations =
      FirebaseFirestore.instance.collection('meditations');

  //Save meditation data in firestore
  // Future<void> SaveMeditation(
  //     {CollectionReference reference,
  //     Map<String, dynamic> data,
  //     String docName}) async {
  //   return reference.doc(docName).set(data);
  // }
}
