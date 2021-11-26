import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _usersCollection = _firestore.collection('users');

class TareasDatabase {
  static String? userUid = FirebaseAuth.instance.currentUser?.uid;

  static Future<void> addItem(
      {required String clase,
      required Timestamp fechaEntrega,
      required String titulo}) async {
    DocumentReference documentReferencer =
        _usersCollection.doc(userUid).collection('tareas').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "clase": clase,
      "fechaEntrega": fechaEntrega,
      "titulo": titulo
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Una tarea agregada al usuario: ${userUid}"))
        .catchError((e) => print(e));
  }

  static Future<void> updateItem({
    required String clase,
    required Timestamp fechaEntrega,
    required String titulo,
    required String docId,
  }) async {
    DocumentReference documentReferencer =
        _usersCollection.doc(userUid).collection('tareas').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "clase": clase,
      "fechaEntrega": fechaEntrega,
      "titulo": titulo
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Tarea editada exitosamente"))
        .catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> readItems() {
    CollectionReference tareasCollectionRef =
        _usersCollection.doc(userUid).collection('tareas');
    return tareasCollectionRef.snapshots();
  }

  static Future<void> deleteItem({
    required String docId,
  }) async {
    DocumentReference documentReferencer =
        _usersCollection.doc(userUid).collection('tareas').doc(docId);

    await documentReferencer
        .delete()
        .whenComplete(() => print('Tarea eliminada exitosamente'))
        .catchError((e) => print(e));
  }
}
