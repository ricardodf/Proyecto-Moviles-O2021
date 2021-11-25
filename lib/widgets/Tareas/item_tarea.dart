import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ItemTarea extends StatefulWidget {
  final String titulo;
  final String clase;
  final Timestamp fechaEntrega;

  const ItemTarea(
      {Key? key,
      required this.titulo,
      required this.clase,
      required this.fechaEntrega})
      : super(key: key);

  @override
  _ItemTareaState createState() => _ItemTareaState();
}

class _ItemTareaState extends State<ItemTarea> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(widget.titulo),
    );
  }
}
