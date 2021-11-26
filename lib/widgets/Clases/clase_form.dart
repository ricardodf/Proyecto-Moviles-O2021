import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:planificador_escolar/services/clases.service.dart';
import 'package:planificador_escolar/services/tareas.service.dart';
import 'package:planificador_escolar/widgets/Tareas/tarea_field.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart'; //for date format
import 'package:intl/date_symbol_data_local.dart';

class ClaseItemForm extends StatefulWidget {
  final FocusNode materiaFocusNode;
  final FocusNode horarioFocusNode;
  final FocusNode maestroFocusNode;
  final FocusNode tareasFocusNode;
  final FocusNode calificacionFocusNode;
  final String documentId;

  final String currentMateria;
  final String currentHorario;
  final String currentMaestro;
  final String currentTareas;
  final String currentCalificacion;
  //final String documentId;

  const ClaseItemForm({
    required this.materiaFocusNode,
    required this.horarioFocusNode,
    required this.maestroFocusNode,
    required this.tareasFocusNode,
    required this.calificacionFocusNode,
    required this.currentMateria,
    required this.currentHorario,
    required this.currentMaestro,
    required this.currentTareas,
    required this.currentCalificacion,
    required this.documentId,
  });

  @override
  _ClaseItemFormState createState() => _ClaseItemFormState();
}

class _ClaseItemFormState extends State<ClaseItemForm> {
  final _TareaItemFormKey = GlobalKey<FormState>();
  final format = DateFormat("yyyy-MM-dd HH:mm");

  bool _isProcessing = false;

  late TextEditingController _MateriaController = TextEditingController();
  late TextEditingController _horarioController = TextEditingController();
  late TextEditingController _maestroController = TextEditingController();
  late TextEditingController _tareasController = TextEditingController();
  late TextEditingController _calificacionController = TextEditingController();

  @override
  void initState() {
    _MateriaController = TextEditingController(
      text: widget.currentMateria,
    );

    _horarioController = TextEditingController(
      text: widget.currentHorario,
    );

    _maestroController = TextEditingController(
      text: widget.currentMaestro,
    );

    _tareasController = TextEditingController(
      text: widget.currentTareas,
    );

    _calificacionController = TextEditingController(
      text: widget.currentCalificacion,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Form(
                      key: _TareaItemFormKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 8.0,
                              right: 8.0,
                              bottom: 24.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10.0),
                                const Text(
                                  'Materia',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18.0,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                CustomFormField(
                                  isLabelEnabled: false,
                                  controller: _MateriaController,
                                  focusNode: widget.materiaFocusNode,
                                  keyboardType: TextInputType.text,
                                  inputAction: TextInputAction.next,
                                ),
                                SizedBox(height: 24.0),
                                const Text(
                                  'Fecha de Entrega',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18.0,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                const Text(
                                  'Maestro',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18.0,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                CustomFormField(
                                  isLabelEnabled: false,
                                  controller: _maestroController,
                                  focusNode: widget.materiaFocusNode,
                                  keyboardType: TextInputType.text,
                                  inputAction: TextInputAction.next,
                                ),
                                SizedBox(height: 8.0),
                                const Text(
                                  'Tareas',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18.0,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                CustomFormField(
                                  isLabelEnabled: false,
                                  controller: _tareasController,
                                  focusNode: widget.materiaFocusNode,
                                  keyboardType: TextInputType.text,
                                  inputAction: TextInputAction.next,
                                ),
                                SizedBox(height: 8.0),
                                const Text(
                                  'Calificación',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18.0,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                CustomFormField(
                                  isLabelEnabled: false,
                                  controller: _calificacionController,
                                  focusNode: widget.materiaFocusNode,
                                  keyboardType: TextInputType.text,
                                  inputAction: TextInputAction.done,
                                ),
                              ],
                            ),
                          ),
                          _isProcessing
                              ? const Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.orangeAccent,
                                    ),
                                  ),
                                )
                              : Container(
                                  width: double.maxFinite,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        Colors.amber[900],
                                      ),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                    onPressed: () async {
                                      widget.materiaFocusNode.unfocus();
                                      widget.maestroFocusNode.unfocus();
                                      widget.horarioFocusNode.unfocus();
                                      widget.tareasFocusNode.unfocus();
                                      widget.calificacionFocusNode.unfocus();

                                      if (_TareaItemFormKey.currentState!
                                          .validate()) {
                                        setState(() {
                                          _isProcessing = true;
                                        });

                                        await ClasesDatabase.updateItem(
                                          nombre: _MateriaController.text,
                                          maestro: _maestroController.text,
                                          tareas:
                                              int.parse(_tareasController.text),
                                          calificacion: int.parse(
                                              _calificacionController.text),
                                          docId: widget.documentId,
                                        );

                                        setState(() {
                                          _isProcessing = false;
                                        });

                                        Navigator.of(context).pop();
                                      }
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: 16.0, bottom: 16.0),
                                      child: Text(
                                        'Guardar Cambios',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    )))));
  }
}
