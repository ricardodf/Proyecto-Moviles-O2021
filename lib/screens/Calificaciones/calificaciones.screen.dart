import 'package:flutter/material.dart';

class CalificacionesScreen extends StatefulWidget {
  const CalificacionesScreen({Key? key}) : super(key: key);

  @override
  _CalificacionesScreenState createState() => _CalificacionesScreenState();
}

class _CalificacionesScreenState extends State<CalificacionesScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text("Esta son las calificaciones"));
  }
}
