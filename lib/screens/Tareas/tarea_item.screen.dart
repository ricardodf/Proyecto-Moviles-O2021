import 'package:flutter/material.dart';
import 'package:planificador_escolar/services/tareas.service.dart';
import 'package:planificador_escolar/widgets/Tareas/tarea_individual.dart';

class TareaIndividualScreen extends StatefulWidget {
  final String currentTitle;
  final String currentDescription;
  final String documentId;

  TareaIndividualScreen({
    required this.currentTitle,
    required this.currentDescription,
    required this.documentId,
  });

  @override
  _TareaIndividualScreenState createState() => _TareaIndividualScreenState();
}

class _TareaIndividualScreenState extends State<TareaIndividualScreen> {
  final FocusNode _titleFocusNode = FocusNode();

  final FocusNode _descriptionFocusNode = FocusNode();

  bool _isDeleting = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _titleFocusNode.unfocus();
        _descriptionFocusNode.unfocus();
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
          title: Text("Tareas"),
          actions: [
            _isDeleting
                ? Padding(
                    padding: const EdgeInsets.only(
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
                    icon: Icon(
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
              titleFocusNode: _titleFocusNode,
              descriptionFocusNode: _descriptionFocusNode,
              currentTitle: widget.currentTitle,
              currentDescription: widget.currentDescription,
            ),
          ),
        ),
      ),
    );
  }
}
