import 'package:flutter/material.dart';
import 'package:planificador_escolar/services/tareas.service.dart';
import 'package:planificador_escolar/widgets/Tareas/add_tarea_form.dart';
import 'package:planificador_escolar/widgets/Tareas/tarea_form.dart';

class AddTareaScreen extends StatelessWidget {
  final FocusNode _tituloFocusNode = FocusNode();
  final FocusNode _descripcionFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _tituloFocusNode.unfocus();
        _descripcionFocusNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [Colors.teal, Colors.indigo],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            )),
          ),
          title: Text("Crear Tarea"),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: AddTareaForm(
              tituloFocusNode: _tituloFocusNode,
              descripcionFocusNode: _descripcionFocusNode,
            ),
          ),
        ),
      ),
    );
  }
}
