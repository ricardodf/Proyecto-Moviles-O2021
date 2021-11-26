import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:planificador_escolar/screens/Clases/Clases.dart';
import 'package:planificador_escolar/screens/Clases/add_clase.screen.dart';
import 'package:planificador_escolar/widgets/Clases/clases_list.dart';

class ClasesScreen extends StatefulWidget {
  const ClasesScreen({Key? key}) : super(key: key);

  @override
  _ClasesScreenState createState() => _ClasesScreenState();
}

class _ClasesScreenState extends State<ClasesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(20),
        child: Theme(
            data: Theme.of(context).copyWith(cardColor: Colors.green[100]),
            child: ClasesList()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddClaseScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.amber[900],
      ),
    );
  }
}
