import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:planificador_escolar/screens/Tareas/tarea_individual.screen.dart';
import 'package:planificador_escolar/services/tareas.service.dart';

class TareasList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: TareasDatabase.readItems(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("Hay un error en la conexión con 'Tareas'");
          } else if (snapshot.hasData || snapshot.data != null) {
            return ListView.separated(
              separatorBuilder: (context, index) =>
                  const SizedBox(height: 16.0),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var tareaData = snapshot.data!.docs[index];
                String docID = snapshot.data!.docs[index].id;
                String titulo = tareaData['titulo'];
                String clase = tareaData['clase'];
                String fechaEntrega =
                    tareaData['fechaEntrega'].toDate().toString();

                print(fechaEntrega);

                return Card(
                  color: Colors.teal[100],
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: const Icon(Icons.home_work),
                        title: Text(titulo),
                        subtitle: Text(clase),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          TextButton(
                            child: const Text('VER'),
                            onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => TareaIndividualScreen(
                                  currentTitulo: titulo,
                                  currentDescripcion: clase,
                                  currentFechaEntrega: fechaEntrega,
                                  documentId: docID,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Colors.orangeAccent,
              ),
            ),
          );
        });
  }
}
