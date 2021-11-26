import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:planificador_escolar/screens/Home/home.screen.dart';
import 'package:planificador_escolar/screens/Login/login.screen.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Homework Planner"),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.blueAccent),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            }),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.account_circle))
        ],
        elevation: 10,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Colors.teal, Colors.indigo],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          )),
        ),
      ),
      body: Column(
        children: [
          SizedBox(width: 50, height: 50),
          Align(alignment: Alignment.center),
          Container(
            child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile.png'),
                maxRadius: 80),
          ),
          SizedBox(height: 25),
          Container(
            child: Text(
              "Ricardo",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontFamily: 'Product Sans Regular'),
            ),
          ),
          Container(
            child: Text(
              "ricardo@gmail.com",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  fontFamily: 'Product Sans Regular'),
            ),
          ),
          SizedBox(height: 20),
          ActionChip(
              label: Text("Cerrar sesión"),
              onPressed: () {
                logout(context);
              }),
        ],
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
