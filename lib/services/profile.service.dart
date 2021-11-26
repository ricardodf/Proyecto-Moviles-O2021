import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _usersCollection = _firestore.collection('users');

class ProfileDatabase {
  static String? userUid = FirebaseAuth.instance.currentUser?.uid;

  static Future<void> addItem({
    required String email,
    required String name,
  }) async {
    DocumentReference documentReferencer =
        _usersCollection.doc(userUid).collection('users').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "email": email,
      "name": name,
    };
  }

  static Future<void> updateItem({
    required String email,
    required String name,
    required String uid,
  }) async {
    DocumentReference documentReferencer =
        _usersCollection.doc(userUid).collection('users').doc(uid);

    Map<String, dynamic> data = <String, dynamic>{
      "email": email,
      "name": name,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Usuario editado exitosamente"))
        .catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> readItems() {
    CollectionReference clasesCollectionRef =
        _usersCollection.doc(userUid).collection('users');
    return clasesCollectionRef.snapshots();
  }

  static Future<void> deleteItem({
    required String docId,
  }) async {
    DocumentReference documentReferencer =
        _usersCollection.doc(userUid).collection('users').doc(docId);

    await documentReferencer
        .delete()
        .whenComplete(() => print('Usuario eliminada exitosamente'))
        .catchError((e) => print(e));
  }
}
