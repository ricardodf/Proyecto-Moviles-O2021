import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Clases extends StatefulWidget {
  const Clases({Key? key}) : super(key: key);

  @override
  _ClasesState createState() => _ClasesState();
}

class _ClasesState extends State<Clases> {
  bool _expanded = false,
      _expanded2 = false,
      _expanded3 = false,
      _expanded4 = false,
      _expanded5 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Homework Planner"),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.keyboard_return_outlined)),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.account_circle))
        ],
        elevation: 10,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.orangeAccent],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          )),
        ),
      ),
      body: ListView(children: [
        //PANEL LIST 1
        Container(
          margin: EdgeInsets.all(20),
          color: Colors.green,
          child: ExpansionPanelList(
            animationDuration: Duration(milliseconds: 2000),
            children: [
              ExpansionPanel(
                headerBuilder: (context, isExpanded) {
                  return ListTile(
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
                                  snapshot.data!.docs[1]['Maestro'].toString(),
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
                                  snapshot.data!.docs[1]['Horario'].toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Product Sans Regular'));
                        },
                      ),
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
        //PANEL LIST 2
        Container(
          margin: EdgeInsets.all(20),
          color: Colors.green,
          child: ExpansionPanelList(
            animationDuration: Duration(milliseconds: 2000),
            children: [
              ExpansionPanel(
                headerBuilder: (context, isExpanded) {
                  return ListTile(
                    title: Text(
                      'Tareas',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Product Sans Regular'),
                    ),
                  );
                },
                body: Column(
                  children: [
                    //FECHA 1
                    Container(
                      margin: EdgeInsets.all(20),
                      color: Colors.green,
                      child: ExpansionPanelList(
                        animationDuration: Duration(milliseconds: 2000),
                        children: [
                          ExpansionPanel(
                            headerBuilder: (context, isExpanded) {
                              return ListTile(
                                title: Text(
                                  '05 nov. 2021',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Product Sans Regular'),
                                ),
                              );
                            },
                            body: Column(
                              children: [
                                ListTile(
                                  leading: Icon(
                                    Icons.my_library_books_outlined,
                                    color: Colors.blue,
                                  ),
                                  title: Text(
                                      'Entregar Proyecto Integrador Parte 2',
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
                        expansionCallback: (panelIndex, isExpanded3) {
                          _expanded3 = !_expanded3;
                          setState(() {});
                        },
                      ),
                    ),
                    //FECHA 2
                    Container(
                      margin: EdgeInsets.all(20),
                      color: Colors.green,
                      child: ExpansionPanelList(
                        animationDuration: Duration(milliseconds: 2000),
                        children: [
                          ExpansionPanel(
                            headerBuilder: (context, isExpanded) {
                              return ListTile(
                                title: Text(
                                  '06 nov. 2021',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Product Sans Regular'),
                                ),
                              );
                            },
                            body: Column(
                              children: [
                                ListTile(
                                  leading: Icon(
                                    Icons.my_library_books_outlined,
                                    color: Colors.blue,
                                  ),
                                  title: Text(
                                      'Entregar Práctica 2: Noticias App - NodeJS',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Product Sans Regular')),
                                ),
                              ],
                            ),
                            isExpanded: _expanded4,
                            canTapOnHeader: true,
                          ),
                        ],
                        dividerColor: Colors.grey,
                        expansionCallback: (panelIndex, isExpanded4) {
                          _expanded4 = !_expanded4;
                          setState(() {});
                        },
                      ),
                    ),
                  ],
                ),
                isExpanded: _expanded2,
                canTapOnHeader: true,
              ),
            ],
            dividerColor: Colors.grey,
            expansionCallback: (panelIndex, isExpanded2) {
              _expanded2 = !_expanded2;
              setState(() {});
            },
          ),
        ),
        //PANEL LIST 3
        Container(
          margin: EdgeInsets.all(20),
          color: Colors.green,
          child: ExpansionPanelList(
            animationDuration: Duration(milliseconds: 2000),
            children: [
              ExpansionPanel(
                headerBuilder: (context, isExpanded) {
                  return ListTile(
                    title: Text(
                      'Calificaciones',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Product Sans Regular'),
                    ),
                  );
                },
                body: DataTable(
                  columns: const <DataColumn>[
                    DataColumn(
                        label: Text('Calificación',
                            style:
                                TextStyle(fontFamily: 'Product Sans Regular'))),
                    DataColumn(
                        label: Text('Concepto',
                            style:
                                TextStyle(fontFamily: 'Product Sans Regular'))),
                  ],
                  rows: const <DataRow>[
                    DataRow(cells: <DataCell>[
                      DataCell(Text('100',
                          style: TextStyle(
                              fontFamily: 'Product Sans Regular',
                              color: Colors.blue))),
                      DataCell(Text('Tareas',
                          style:
                              TextStyle(fontFamily: 'Product Sans Regular'))),
                    ]),
                    DataRow(cells: <DataCell>[
                      DataCell(Text('100',
                          style: TextStyle(
                              fontFamily: 'Product Sans Regular',
                              color: Colors.blue))),
                      DataCell(Text('Prácticas',
                          style:
                              TextStyle(fontFamily: 'Product Sans Regular'))),
                    ]),
                    DataRow(cells: <DataCell>[
                      DataCell(Text('100',
                          style: TextStyle(
                              fontFamily: 'Product Sans Regular',
                              color: Colors.blue))),
                      DataCell(Text('Exámenes',
                          style:
                              TextStyle(fontFamily: 'Product Sans Regular'))),
                    ]),
                    DataRow(cells: <DataCell>[
                      DataCell(Text('100',
                          style: TextStyle(
                              fontFamily: 'Product Sans Regular',
                              color: Colors.blue))),
                      DataCell(Text('Proyecto',
                          style:
                              TextStyle(fontFamily: 'Product Sans Regular'))),
                    ])
                  ],
                ),
                isExpanded: _expanded5,
                canTapOnHeader: true,
              ),
            ],
            dividerColor: Colors.grey,
            expansionCallback: (panelIndex, isExpanded5) {
              _expanded5 = !_expanded5;
              setState(() {});
            },
          ),
        ),
      ]),
      //SIDEBAR
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(height: 80),
            ListTile(
              leading: Icon(
                Icons.calendar_today_outlined,
                color: Colors.blue,
              ),
              title: const Text('Calendario',
                  style: TextStyle(
                      fontFamily: 'Product Sans Regular', fontSize: 20)),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.class__outlined, color: Colors.blue),
              title: const Text('Clases',
                  style: TextStyle(
                      fontFamily: 'Product Sans Regular', fontSize: 20)),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.task_outlined, color: Colors.blue),
              title: const Text('Tareas',
                  style: TextStyle(
                      fontFamily: 'Product Sans Regular', fontSize: 20)),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.grade, color: Colors.orange),
              title: const Text('Calificaciones',
                  style: TextStyle(
                      fontFamily: 'Product Sans Regular', fontSize: 20)),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
