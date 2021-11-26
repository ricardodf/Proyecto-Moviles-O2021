import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:planificador_escolar/screens/Tareas/add_tarea.screen.dart';
import 'package:planificador_escolar/services/clases.service.dart';

class ClasesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: ClasesDatabase.readItems(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Text('Loading...');
          //final String projectsCount = snapshot.data.documents.length;
          List<DocumentSnapshot> documents = snapshot.data!.docs;
          return ExpansionTileList(
            documents: documents,
          );
        });
  }
}

class ExpansionTileList extends StatelessWidget {
  final List<DocumentSnapshot> documents;

  ExpansionTileList({required this.documents});

  List<Widget> _getChildren() {
    List<Widget> children = [];
    documents.forEach((doc) {
      children.add(
        ProjectsExpansionTile(
          projectKey: doc.id,
          nombre: doc['nombre'],
          maestro: doc['maestro'],
          tareas: doc['tareas'].toString(),
          calificacion: doc['calificacion'].toString(),
        ),
      );
    });
    return children;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _getChildren(),
    );
  }
}

class ProjectsExpansionTile extends StatelessWidget {
  ProjectsExpansionTile(
      {required this.projectKey,
      required this.nombre,
      required this.maestro,
      required this.tareas,
      required this.calificacion});

  final String projectKey;
  final String nombre;
  final String maestro;
  final String tareas;
  final String calificacion;

  @override
  Widget build(BuildContext context) {
    PageStorageKey _projectKey = PageStorageKey('$projectKey');

    return Theme(
      data: ThemeData(unselectedWidgetColor: Colors.teal[800]),
      child: ExpansionTile(
        key: _projectKey,
        title: Text(
          nombre,
          style: TextStyle(fontSize: 18.0),
        ),
        tilePadding: EdgeInsets.symmetric(vertical: 12.0),
        children: <Widget>[
          Column(
            children: [
              ListTile(
                leading: const Icon(
                  Icons.person,
                  color: Colors.blue,
                ),
                title: Text('Maestro: ${maestro}',
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Product Sans Regular')),
              ),
              ListTile(
                leading: const Icon(
                  Icons.schedule_outlined,
                  color: Colors.blue,
                ),
                title: Text('Horario: ${DateTime.now()}',
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Product Sans Regular')),
              ),
              ListTile(
                leading: const Icon(
                  Icons.menu_book_rounded,
                  color: Colors.blue,
                ),
                title: Text('Tareas: ${tareas}',
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Product Sans Regular')),
              ),
              ListTile(
                leading: const Icon(
                  Icons.grade_rounded,
                  color: Colors.blue,
                ),
                title: Text('Calificación: ${calificacion}',
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Product Sans Regular')),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => AddTareaScreen()));
                    },
                    icon: Icon(Icons.navigation_sharp),
                    color: Colors.blue,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
