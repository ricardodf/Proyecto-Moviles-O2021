import 'package:flutter/material.dart';

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
          ListTile(
            leading: Icon(Icons.settings, color: Colors.blue),
            title: Text('Settings',
                style: TextStyle(
                    fontSize: 20, fontFamily: 'Product Sans Regular')),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          ListTile(
            leading: Icon(Icons.support_agent_outlined, color: Colors.blue),
            title: Text('Support',
                style: TextStyle(
                    fontSize: 20, fontFamily: 'Product Sans Regular')),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          ListTile(
            leading: Icon(Icons.logout_outlined, color: Colors.blue),
            title: Text('Log Out',
                style: TextStyle(
                    fontSize: 20, fontFamily: 'Product Sans Regular')),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
        ],
      ),
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
