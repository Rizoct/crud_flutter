import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class ShowUserPage extends StatefulWidget {
  const ShowUserPage({Key? key}) : super(key: key);
  @override
  State<ShowUserPage> createState() => _ShowUserPage();
}

class _ShowUserPage extends State<ShowUserPage> {
  final controllerName = TextEditingController();
  final controllerAge = TextEditingController();
  Future getDocs() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("collection").get();
    for (int i = 0; i < querySnapshot.docs.length; i++) {
      var a = querySnapshot.docs[i];
    }
  }

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    final Stream<QuerySnapshot> users =
        FirebaseFirestore.instance.collection('users').snapshots();

    return Scaffold(
        appBar: AppBar(
          title: const Text("Users"),
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: users,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Something Went Wrong');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text('Loading');
              }

              final data = snapshot.requireData;

              return ListView.builder(
                  itemCount: data.size,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: ListTile(
                        title: Text('Name : ${data.docs[index]['name']}'),
                        subtitle: Text('Age : ${data.docs[index]['age']}'),
                      ),
                      elevation: 2,
                    );
                  });
            }));
  }
}
