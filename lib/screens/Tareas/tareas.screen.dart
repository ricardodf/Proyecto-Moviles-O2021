import 'package:flutter/material.dart';
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
          _showDialog();
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.amber[900],
      ),
    );
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Nueva Clase"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Nombre'),
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Maestro'),
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Horario'),
                      ),
                      Container(
                        margin: EdgeInsets.all(10.0),
                        child: RaisedButton(
                          onPressed: () {},
                          child: Text('Crear'),
                          color: Colors.deepOrange,
                          textColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new TextButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
