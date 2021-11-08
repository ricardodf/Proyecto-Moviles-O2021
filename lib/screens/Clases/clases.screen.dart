import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class ClasesScreen extends StatefulWidget {
  const ClasesScreen({Key? key}) : super(key: key);

  @override
  _ClasesScreenState createState() => _ClasesScreenState();
}

class _ClasesScreenState extends State<ClasesScreen> {
  final _formKey = GlobalKey<FormState>();

  bool _expanded = false, _expanded2 = false, _expanded3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        //PANEL LIST 1
        Container(
          margin: EdgeInsets.all(20),
          color: Colors.green[50],
          child: Theme(
            data: Theme.of(context).copyWith(cardColor: Colors.green[100]),
            child: ExpansionPanelList(
              animationDuration: Duration(milliseconds: 1000),
              children: [
                ExpansionPanel(
                  headerBuilder: (context, isExpanded) {
                    return ListTile(
                      title: Text(
                        'Seguridad en Redes',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Product Sans Regular'),
                      ),
                    );
                  },
                  body: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.person,
                          color: Colors.blue,
                        ),
                        title: Text('Maestro:',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Product Sans Regular')),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.schedule_outlined,
                          color: Colors.blue,
                        ),
                        title: Text('Horario:',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Product Sans Regular')),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.menu_book_rounded,
                          color: Colors.blue,
                        ),
                        title: Text('Tareas: ',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Product Sans Regular')),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.grade_rounded,
                          color: Colors.blue,
                        ),
                        title: Text('Calificación: ',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Product Sans Regular')),
                      ),
                    ],
                  ),
                  isExpanded: _expanded,
                  canTapOnHeader: true,
                ),
              ],
              dividerColor: Colors.grey,
              expansionCallback: (panelIndex, isExpanded) {
                _expanded = !_expanded;
                setState(() {});
              },
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(20),
          color: Colors.green[50],
          child: Theme(
            data: Theme.of(context).copyWith(cardColor: Colors.blue[100]),
            child: ExpansionPanelList(
              animationDuration: Duration(milliseconds: 1000),
              children: [
                ExpansionPanel(
                  headerBuilder: (context, isExpanded) {
                    return ListTile(
                      title: Text(
                        'PAP: Vida Digital',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Product Sans Regular'),
                      ),
                    );
                  },
                  body: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.person,
                          color: Colors.blue,
                        ),
                        title: Text('Maestro:',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Product Sans Regular')),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.schedule_outlined,
                          color: Colors.blue,
                        ),
                        title: Text('Horario:',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Product Sans Regular')),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.menu_book_rounded,
                          color: Colors.blue,
                        ),
                        title: Text('Tareas: ',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Product Sans Regular')),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.grade_rounded,
                          color: Colors.blue,
                        ),
                        title: Text('Calificación: ',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Product Sans Regular')),
                      ),
                    ],
                  ),
                  isExpanded: _expanded2,
                  canTapOnHeader: true,
                ),
              ],
              dividerColor: Colors.grey,
              expansionCallback: (panelIndex, isExpanded) {
                _expanded2 = !_expanded2;
                setState(() {});
              },
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(20),
          color: Colors.green[50],
          child: Theme(
            data: Theme.of(context).copyWith(cardColor: Colors.deepPurple[100]),
            child: ExpansionPanelList(
              animationDuration: Duration(milliseconds: 1000),
              children: [
                ExpansionPanel(
                  headerBuilder: (context, isExpanded) {
                    return ListTile(
                      title: Text(
                        'Calidad de Software',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Product Sans Regular'),
                      ),
                    );
                  },
                  body: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.person,
                          color: Colors.blue,
                        ),
                        title: Text('Maestro:',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Product Sans Regular')),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.schedule_outlined,
                          color: Colors.blue,
                        ),
                        title: Text('Horario:',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Product Sans Regular')),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.menu_book_rounded,
                          color: Colors.blue,
                        ),
                        title: Text('Tareas: ',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Product Sans Regular')),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.grade_rounded,
                          color: Colors.blue,
                        ),
                        title: Text('Calificación: ',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Product Sans Regular')),
                      ),
                    ],
                  ),
                  isExpanded: _expanded3,
                  canTapOnHeader: true,
                ),
              ],
              dividerColor: Colors.grey,
              expansionCallback: (panelIndex, isExpanded) {
                _expanded3 = !_expanded3;
                setState(() {});
              },
            ),
          ),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showDialog();
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.redAccent,
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
