import 'package:flutter/material.dart';
import 'package:planificador_escolar/screens/Tareas/add_tarea.screen.dart';
import 'package:planificador_escolar/widgets/Tareas/tareas_list.dart';

class TareasScreen extends StatefulWidget {
  const TareasScreen({Key? key}) : super(key: key);

  @override
  _TareasScreenState createState() => _TareasScreenState();
}

class _TareasScreenState extends State<TareasScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height) / 9;
    final double itemWidth = size.width / 2;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: 20.0,
            left: 16.0,
            right: 16.0,
            bottom: 20.0,
          ),
          child: TareasList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddTareaScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.amber[900],
      ),
    );
  }
}
