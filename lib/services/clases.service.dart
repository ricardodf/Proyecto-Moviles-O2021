import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _usersCollection = _firestore.collection('users');

class ClasesDatabase {
  static String? userUid = FirebaseAuth.instance.currentUser?.uid;

  static Future<void> addItem({
    required String nombre,
    required String maestro,
    required int tareas,
    required int calificacion,
  }) async {
    DocumentReference documentReferencer =
        _usersCollection.doc(userUid).collection('clases').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "nombre": nombre,
      "maestro": maestro,
      "tareas": tareas,
      "calificacion": calificacion
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Una clase agregada al usuario: ${userUid}"))
        .catchError((e) => print(e));
  }

  static Future<void> updateItem({
    required String nombre,
    required String maestro,
    required int tareas,
    required int calificacion,
    required String docId,
  }) async {
    DocumentReference documentReferencer =
        _usersCollection.doc(userUid).collection('clases').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "nombre": nombre,
      "maestro": maestro,
      "tareas": tareas,
      "calificacion": calificacion
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Clase editada exitosamente"))
        .catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> readItems() {
    CollectionReference clasesCollectionRef =
        _usersCollection.doc(userUid).collection('clases');
    return clasesCollectionRef.snapshots();
  }

  static Future<void> deleteItem({
    required String docId,
  }) async {
    DocumentReference documentReferencer =
        _usersCollection.doc(userUid).collection('clases').doc(docId);

    await documentReferencer
        .delete()
        .whenComplete(() => print('Clase eliminada exitosamente'))
        .catchError((e) => print(e));
  }
}
