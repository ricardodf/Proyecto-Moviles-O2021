import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:planificador_escolar/services/clases.service.dart';
import 'package:planificador_escolar/widgets/Tareas/tarea_field.dart';
import 'package:intl/intl.dart'; //for date format

class AddClaseForm extends StatefulWidget {
  final FocusNode materiaFocusNode;
  final FocusNode horarioFocusNode;
  final FocusNode maestroFocusNode;
  final FocusNode tareasFocusNode;
  final FocusNode calificacionFocusNode;

  const AddClaseForm({
    required this.materiaFocusNode,
    required this.horarioFocusNode,
    required this.maestroFocusNode,
    required this.tareasFocusNode,
    required this.calificacionFocusNode,
  });

  @override
  _AddClaseFormState createState() => _AddClaseFormState();
}

class _AddClaseFormState extends State<AddClaseForm> {
  final _AddClaseFormKey = GlobalKey<FormState>();

  bool _isProcessing = false;

  late TextEditingController _MateriaController = TextEditingController();
  late TextEditingController _horarioController = TextEditingController();
  late TextEditingController _maestroController = TextEditingController();
  late TextEditingController _tareasController = TextEditingController();
  late TextEditingController _calificacionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Form(
                      key: _AddClaseFormKey,
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
                                  focusNode: widget.maestroFocusNode,
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
                                  focusNode: widget.tareasFocusNode,
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
                                  focusNode: widget.calificacionFocusNode,
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

                                      if (_AddClaseFormKey.currentState!
                                          .validate()) {
                                        setState(() {
                                          _isProcessing = true;
                                        });

                                        await ClasesDatabase.addItem(
                                          nombre: _MateriaController.text,
                                          maestro: _maestroController.text,
                                          tareas:
                                              int.parse(_tareasController.text),
                                          calificacion: int.parse(
                                              _calificacionController.text),
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
                                        'Crear Clase',
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
