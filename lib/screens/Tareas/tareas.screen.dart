import 'package:flutter/material.dart';

class TareasScreen extends StatefulWidget {
  const TareasScreen({Key? key}) : super(key: key);

  @override
  _TareasScreenState createState() => _TareasScreenState();
}

class _TareasScreenState extends State<TareasScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height) / 9;
    final double itemWidth = size.width / 2;

    return Scaffold(
        body: GridView.count(
      crossAxisCount: 1,
      childAspectRatio: (itemWidth / itemHeight),
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            color: Colors.deepPurple[100],
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.home_work),
                  title: Text('Reporte Laboratorio 3'),
                  subtitle: Text('Calidad de Software - 8 Nov (07:00)'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                      child: const Text('VER'),
                      onPressed: () {/* ... */},
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            color: Colors.deepPurple[100],
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.book),
                  title: Text('Lectura'),
                  subtitle: Text('Calidad de Software - 8 Nov (23:59)'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                      child: const Text('VER'),
                      onPressed: () {/* ... */},
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            color: Colors.blue[100],
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.label_important),
                  title: Text('Reporte PAP, Primera Parte'),
                  subtitle: Text('PAP - 04 Dic (23:59)'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                      child: const Text('VER'),
                      onPressed: () {/* ... */},
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
