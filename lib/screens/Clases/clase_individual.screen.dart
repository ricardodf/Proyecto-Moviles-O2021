import 'package:flutter/material.dart';
import 'package:planificador_escolar/screens/Home/home.screen.dart';
import 'package:planificador_escolar/services/clases.service.dart';
import 'package:planificador_escolar/services/tareas.service.dart';
import 'package:planificador_escolar/widgets/Clases/clase_form.dart';
import 'package:planificador_escolar/widgets/Tareas/tarea_form.dart';

class ClaseIndividualScreen extends StatefulWidget {
  final String currentNombre;
  final String currentMaestro;
  final String currentTareas;
  final String currentCalificacion;
  final String currentHorario;
  final String documentId;

  ClaseIndividualScreen({
    required this.currentNombre,
    required this.currentMaestro,
    required this.currentTareas,
    required this.currentCalificacion,
    required this.currentHorario,
    required this.documentId,
  });

  @override
  _ClaseIndividualScreenState createState() => _ClaseIndividualScreenState();
}

class _ClaseIndividualScreenState extends State<ClaseIndividualScreen> {
  final FocusNode _nombreFocusNode = FocusNode();
  final FocusNode _maestroFocusNode = FocusNode();
  final FocusNode _tareasFocusNode = FocusNode();
  final FocusNode _calificacionFocusNode = FocusNode();
  final FocusNode _horarioFocusNode = FocusNode();

  bool _isDeleting = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _nombreFocusNode.unfocus();
        _maestroFocusNode.unfocus();
        _tareasFocusNode.unfocus();
        _calificacionFocusNode.unfocus();
        _horarioFocusNode.unfocus();
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
          title: Text("Editar Clase"),
          actions: [
            _isDeleting
                ? const Padding(
                    padding: EdgeInsets.only(
                      top: 10.0,
                      bottom: 10.0,
                      right: 16.0,
                    ),
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.redAccent,
                      ),
                      strokeWidth: 3,
                    ),
                  )
                : IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.redAccent,
                      size: 32,
                    ),
                    onPressed: () async {
                      setState(() {
                        _isDeleting = true;
                      });

                      await ClasesDatabase.deleteItem(
                        docId: widget.documentId,
                      );

                      setState(() {
                        _isDeleting = false;
                      });

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
                    },
                  ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: ClaseItemForm(
                documentId: widget.documentId,
                materiaFocusNode: _nombreFocusNode,
                maestroFocusNode: _maestroFocusNode,
                tareasFocusNode: _tareasFocusNode,
                calificacionFocusNode: _calificacionFocusNode,
                horarioFocusNode: _horarioFocusNode,
                currentMateria: widget.currentNombre,
                currentMaestro: widget.currentMaestro,
                currentTareas: widget.currentTareas,
                currentCalificacion: widget.currentCalificacion,
                currentHorario: widget.currentHorario),
          ),
        ),
      ),
    );
  }
}
