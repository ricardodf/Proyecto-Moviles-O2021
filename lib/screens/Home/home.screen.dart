import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:planificador_escolar/data/user.model.dart';
import 'package:planificador_escolar/screens/Clases/clases.screen.dart';
import 'package:planificador_escolar/screens/Login/login.screen.dart';
import 'package:planificador_escolar/screens/Tareas/tareas.screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel currentUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.currentUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Homework Planner"),
            centerTitle: true,
            leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
            actions: [
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.account_circle))
            ],
            elevation: 10,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [Colors.redAccent, Colors.orangeAccent],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
              )),
            ),
            bottom: TabBar(indicatorColor: Colors.white, tabs: [
              Tab(icon: Icon(Icons.my_library_books_outlined), text: 'Tareas'),
              Tab(icon: Icon(Icons.menu_book_rounded), text: 'Clases'),
              Tab(icon: Icon(Icons.calendar_today_rounded), text: 'Calendario'),
            ]),
          ),
          body: TabBarView(
            children: [
              TareasScreen(),
              ClasesScreen(),
              Icon(Icons.directions_bike),
            ],
          )),
    );
  }
}
