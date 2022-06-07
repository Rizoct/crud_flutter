import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class AddUserPage extends StatefulWidget {
  const AddUserPage({Key? key}) : super(key: key);
  @override
  State<AddUserPage> createState() => _AddUserPage();
}

class _AddUserPage extends State<AddUserPage> {
  final controllerName = TextEditingController();
  final controllerAge = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add User"),
      ),
      body: Center(
          child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: controllerName,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: controllerAge,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Age',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, left: 100, right: 100),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.indigo,
                  onPrimary: Colors.white,
                  fixedSize: Size(50, 50)),
              onPressed: () {
                final name = controllerName.text;
                final age = controllerAge.text;
                createUser(name: name, age: age);
              },
              child: const Text('Add User'),
            ),
          ),
        ],
      )),
    );
  }

  Future createUser({required String name, age}) async {
    await Firebase.initializeApp();
    final docUser = FirebaseFirestore.instance.collection('users').doc();
    final json = {
      'id': docUser.id,
      'name': name,
      'age': age,
      'birthdate': DateTime(2001, 10, 27),
    };
    await docUser.set(json);
  }
}
