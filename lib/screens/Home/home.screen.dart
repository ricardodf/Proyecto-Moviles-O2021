import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("HomeworkPal"),
          centerTitle: true,
        ),
        body: Center(
            child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        height: 180,
                        child: Image.asset("assets/images/main_logo.png",
                            fit: BoxFit.contain)),
                    SizedBox(height: 10),
                    Text("Esta la pagina de Home",
                        style: TextStyle(fontSize: 20)),
                    SizedBox(height: 20),
                    ActionChip(label: Text("Cerrar sesión"), onPressed: () {})
                  ],
                ))));
  }
}
