import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:planificador_escolar/screens/Clases/Clases.dart';

class ClasesScreen extends StatefulWidget {
  const ClasesScreen({Key? key}) : super(key: key);

  @override
  _ClasesScreenState createState() => _ClasesScreenState();
}

class _ClasesScreenState extends State<ClasesScreen> {
  final _formKey = GlobalKey<FormState>();

  bool _expanded = false, _expanded2 = false;

  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        //PANEL LIST 1
        Container(
          margin: EdgeInsets.all(20),
          child: Theme(
            data: Theme.of(context).copyWith(),
            child: ExpansionPanelList(
              animationDuration: Duration(milliseconds: 1000),
              children: [
                ExpansionPanel(
                  headerBuilder: (context, isExpanded) {
                    return ListTile(
                      //EMPIEZA TEXTO

                      title: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('clases')
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) return Text("Loading Data");
                          return Text(
                              snapshot.data!.docs[1]['Materia'].toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontFamily: 'Product Sans Regular'));
                        },
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
                        title: StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('clases')
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) return Text("Loading Data");
                            return Text(
                                'Maestro: ' +
                                    snapshot.data!.docs[1]['Maestro']
                                        .toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Product Sans Regular'));
                          },
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.schedule_outlined,
                          color: Colors.blue,
                        ),
                        title: StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('clases')
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) return Text("Loading Data");
                            return Text(
                                'Horario: ' +
                                    snapshot.data!.docs[1]['Horario']
                                        .toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Product Sans Regular'));
                          },
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.menu_book_rounded,
                          color: Colors.blue,
                        ),
                        title: StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('clases')
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) return Text("Loading Data");
                            return Text(
                                'Tareas: ' +
                                    snapshot.data!.docs[1]['Tareas'].toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Product Sans Regular'));
                          },
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.grade_rounded,
                          color: Colors.blue,
                        ),
                        title: StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('clases')
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) return Text("Loading Data");
                            return Text(
                                'Calificación: ' +
                                    snapshot.data!.docs[1]['Calificacion']
                                        .toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Product Sans Regular'));
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => Clases()));
                            },
                            icon: Icon(Icons.navigation_sharp),
                            color: Colors.blue,
                          )
                        ],
                      )
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

        //CLASE 2
        Container(
          margin: EdgeInsets.all(20),
          child: Theme(
            data: Theme.of(context).copyWith(),
            child: ExpansionPanelList(
              animationDuration: Duration(milliseconds: 1000),
              children: [
                ExpansionPanel(
                  headerBuilder: (context, isExpanded) {
                    return ListTile(
                      //EMPIEZA TEXTO
                      title: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('clases')
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) return Text("Loading Data");
                          return Text(
                              snapshot.data!.docs[0]['Materia'].toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontFamily: 'Product Sans Regular'));
                        },
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
                        title: StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('clases')
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) return Text("Loading Data");
                            return Text(
                                'Maestro: ' +
                                    snapshot.data!.docs[0]['Maestro']
                                        .toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Product Sans Regular'));
                          },
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.schedule_outlined,
                          color: Colors.blue,
                        ),
                        title: StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('clases')
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) return Text("Loading Data");
                            return Text(
                                'Horario: ' +
                                    snapshot.data!.docs[0]['Horario']
                                        .toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Product Sans Regular'));
                          },
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.menu_book_rounded,
                          color: Colors.blue,
                        ),
                        title: StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('clases')
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) return Text("Loading Data");
                            return Text(
                                'Tareas: ' +
                                    snapshot.data!.docs[0]['Tareas'].toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Product Sans Regular'));
                          },
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.grade_rounded,
                          color: Colors.blue,
                        ),
                        title: StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('clases')
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) return Text("Loading Data");
                            return Text(
                                'Calificación: ' +
                                    snapshot.data!.docs[0]['Calificacion']
                                        .toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Product Sans Regular'));
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => Clases()));
                            },
                            icon: Icon(Icons.navigation_sharp),
                            color: Colors.blue,
                          )
                        ],
                      )
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
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showDialog();
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.blueAccent,
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
