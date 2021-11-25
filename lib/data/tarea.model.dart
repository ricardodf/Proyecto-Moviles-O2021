import 'package:cloud_firestore/cloud_firestore.dart';

class TareaModel {
  String? clase;
  Timestamp? fechaEntrega;
  String? titulo;
  String? idUser;

  TareaModel({this.clase, this.fechaEntrega, this.titulo, this.idUser});

  factory TareaModel.fromMap(map) {
    return TareaModel(
        clase: map['clase'],
        fechaEntrega: map['fechaEntrega'],
        titulo: map['titulo'],
        idUser: map['idUser']);
  }

  Map<String, dynamic> toMap() {
    return {
      'clase': clase,
      'fechaEntrega': fechaEntrega,
      'titulo': titulo,
      'idUser': idUser
    };
  }
}
