import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

CollectionReference users = FirebaseFirestore.instance.collection('users');

class EditUserPage extends StatefulWidget {
  String name, age, id;
  EditUserPage(
      {required this.name, required this.age, required this.id, Key? key})
      : super(key: key);
  @override
  State<EditUserPage> createState() => _EditUserPage();
}

class _EditUserPage extends State<EditUserPage> {
  @override
  Widget build(BuildContext context) {
    final controllerName = TextEditingController(text: widget.name);
    final controllerAge = TextEditingController(text: widget.age);
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit ${widget.name}'),
      ),
      body: Center(
          child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              controller: controllerName,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextFormField(
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
                updateUser(id: widget.id, age: age, name: name);
              },
              child: const Text('Edit User'),
            ),
          ),
        ],
      )),
    );
  }

  Future<void> updateUser(
      {required String id, required String age, required String name}) {
    return users
        .doc(id)
        .update({'age': age, 'name': name})
        .then((value) => print('User Updated'))
        .catchError((error) => print('error : $error'));
  }
}
