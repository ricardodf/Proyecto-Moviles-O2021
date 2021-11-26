import 'package:flutter/material.dart';
import 'package:planificador_escolar/services/tareas.service.dart';
import 'package:planificador_escolar/widgets/Tareas/tarea_form.dart';

class TareaIndividualScreen extends StatefulWidget {
  final String currentTitulo;
  final String currentDescripcion;
  final String currentFechaEntrega;
  final String documentId;

  TareaIndividualScreen({
    required this.currentTitulo,
    required this.currentDescripcion,
    required this.currentFechaEntrega,
    required this.documentId,
  });

  @override
  _TareaIndividualScreenState createState() => _TareaIndividualScreenState();
}

class _TareaIndividualScreenState extends State<TareaIndividualScreen> {
  final FocusNode _tituloFocusNode = FocusNode();

  final FocusNode _descripcionFocusNode = FocusNode();

  bool _isDeleting = false;

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
          title: Text("Editar Tarea"),
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

                      await TareasDatabase.deleteItem(
                        docId: widget.documentId,
                      );

                      setState(() {
                        _isDeleting = false;
                      });

                      Navigator.of(context).pop();
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
            child: TareaItemForm(
                documentId: widget.documentId,
                tituloFocusNode: _tituloFocusNode,
                descripcionFocusNode: _descripcionFocusNode,
                currentTitulo: widget.currentTitulo,
                currentDescripcion: widget.currentDescripcion,
                currentFechaEntrega: widget.currentFechaEntrega),
          ),
        ),
      ),
    );
  }
}
