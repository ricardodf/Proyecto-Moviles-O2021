import 'package:flutter/material.dart';
import 'package:planificador_escolar/services/tareas.service.dart';
import 'package:planificador_escolar/widgets/Clases/add_clase_form.dart';
import 'package:planificador_escolar/widgets/Tareas/add_tarea_form.dart';
import 'package:planificador_escolar/widgets/Tareas/tarea_form.dart';

class AddClaseScreen extends StatelessWidget {
  final FocusNode _MateriaFocusNode = FocusNode();
  final FocusNode _HorarioFocusNode = FocusNode();
  final FocusNode _MaestroFocusNode = FocusNode();
  final FocusNode _TareasFocusNode = FocusNode();
  final FocusNode _CalificacionFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _MateriaFocusNode.unfocus();
        _HorarioFocusNode.unfocus();
        _MaestroFocusNode.unfocus();
        _TareasFocusNode.unfocus();
        _CalificacionFocusNode.unfocus();
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
          title: Text("Crear Clase"),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: AddClaseForm(
              materiaFocusNode: _MateriaFocusNode,
              horarioFocusNode: _HorarioFocusNode,
              maestroFocusNode: _MaestroFocusNode,
              tareasFocusNode: _TareasFocusNode,
              calificacionFocusNode: _CalificacionFocusNode,
            ),
          ),
        ),
      ),
    );
  }
}
