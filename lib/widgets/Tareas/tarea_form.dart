import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:planificador_escolar/services/tareas.service.dart';
import 'package:planificador_escolar/widgets/Tareas/tarea_field.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart'; //for date format
import 'package:intl/date_symbol_data_local.dart';

class TareaItemForm extends StatefulWidget {
  final FocusNode tituloFocusNode;
  final FocusNode descripcionFocusNode;
  final String currentTitulo;
  final String currentDescripcion;
  final String currentFechaEntrega;
  final String documentId;

  const TareaItemForm({
    required this.tituloFocusNode,
    required this.descripcionFocusNode,
    required this.currentTitulo,
    required this.currentDescripcion,
    required this.currentFechaEntrega,
    required this.documentId,
  });

  @override
  _TareaItemFormState createState() => _TareaItemFormState();
}

class _TareaItemFormState extends State<TareaItemForm> {
  final _TareaItemFormKey = GlobalKey<FormState>();
  final format = DateFormat("yyyy-MM-dd HH:mm");

  bool _isProcessing = false;

  late TextEditingController _tituloController;
  late TextEditingController _descriptionController;
  late TextEditingController _fechaEntregaController;

  @override
  void initState() {
    _tituloController = TextEditingController(
      text: widget.currentTitulo,
    );

    _descriptionController = TextEditingController(
      text: widget.currentDescripcion,
    );

    _fechaEntregaController =
        TextEditingController(text: widget.currentFechaEntrega);
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
                                  'Titulo',
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
                                  controller: _tituloController,
                                  focusNode: widget.tituloFocusNode,
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
                                DateTimeField(
                                  controller: _fechaEntregaController,
                                  format: format,
                                  onShowPicker: (context, currentValue) async {
                                    final date = await showDatePicker(
                                        context: context,
                                        firstDate: DateTime(1900),
                                        initialDate:
                                            currentValue ?? DateTime.now(),
                                        lastDate: DateTime(2100));
                                    if (date != null) {
                                      final time = await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.fromDateTime(
                                            currentValue ?? DateTime.now()),
                                      );
                                      return DateTimeField.combine(date, time);
                                    } else {
                                      return currentValue;
                                    }
                                  },
                                ),
                                SizedBox(height: 24.0),
                                const Text(
                                  'Descripcion',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18.0,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                CustomFormField(
                                  maxLines: 10,
                                  isLabelEnabled: false,
                                  controller: _descriptionController,
                                  focusNode: widget.descripcionFocusNode,
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
                                      widget.tituloFocusNode.unfocus();
                                      widget.descripcionFocusNode.unfocus();

                                      if (_TareaItemFormKey.currentState!
                                          .validate()) {
                                        setState(() {
                                          _isProcessing = true;
                                        });

                                        await TareasDatabase.updateItem(
                                            docId: widget.documentId,
                                            titulo: _tituloController.text,
                                            clase: _descriptionController.text,
                                            fechaEntrega: Timestamp.fromDate(
                                                DateTime.parse(
                                                    _fechaEntregaController
                                                        .text)));

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
