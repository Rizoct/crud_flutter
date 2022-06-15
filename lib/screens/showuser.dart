import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_flutter_tes/screens/edituser.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

CollectionReference users_data = FirebaseFirestore.instance.collection('users');

Widget continueButton = TextButton(
  child: Text("Continue"),
  onPressed: () {},
);

Future<void> deleteUser(userId) {
  print("$userId");
  return users_data
      .doc("$userId")
      .delete()
      .then((value) => print("User Deleted"))
      .catchError((error) => print("Failed to delete : $error"));
}

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
                      elevation: 2,
                      child: Column(
                        children: [
                          ListTile(
                            title: Text('Name : ${data.docs[index]['name']}'),
                            subtitle: Text('Age : ${data.docs[index]['age']}'),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              TextButton(
                                  child: const Text('EDIT'),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (contexet) => EditUserPage(
                                                  name: data.docs[index]['name']
                                                      .toString(),
                                                  age: data.docs[index]['age']
                                                      .toString(),
                                                  id: data.docs[index]['id']
                                                      .toString(),
                                                )));
                                  }),
                              const SizedBox(width: 8),
                              TextButton(
                                child: const Text('DELETE'),
                                onPressed: () => showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: Text(
                                        'Apakah anda ingin menghapus ${data.docs[index]['name']} ??'),
                                    content:
                                        const Text('AlertDialog description'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'Cancel'),
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () => deleteUser(
                                            data.docs[index]['id'].toString()),
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                            ],
                          ),
                        ],
                      ),
                    );
                  });
            }));
  }
}
