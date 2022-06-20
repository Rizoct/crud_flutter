import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:io';
import 'adduser.dart';
import 'showuser.dart';
import 'package:crud_flutter_tes/drawers/mainDrawer.dart';

class MainMenuPage extends StatefulWidget {
  MainMenuPage({Key? key}) : super(key: key);
  @override
  State<MainMenuPage> createState() => _MainMenuPage();
}

class _MainMenuPage extends State<MainMenuPage> {
  @override
  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit an App'),
            actions: <Widget>[
              TextButton(
                onPressed: () =>
                    Navigator.of(context).pop(false), //<-- SEE HERE
                child: new Text('No'),
              ),
              TextButton(
                onPressed: () => exit(0), // <-- SEE HERE
                child: new Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          title: Text('Main Menu'),
        ),
        body: Container(
            width: double.infinity,
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Container(
                    width: double.infinity,
                    height: 150,
                    color: Colors.black,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 10),
                      child: Card(
                          shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: InkWell(
                            splashColor: Colors.blue.withAlpha(30),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (contexet) =>
                                          const ShowUserPage()));
                            },
                            child: SizedBox(
                              width: 150,
                              height: 110,
                              child: Center(
                                child: ListView(
                                    shrinkWrap: true,
                                    padding: const EdgeInsets.all(20.0),
                                    children: const [
                                      Icon(
                                        Icons.people,
                                        color: Colors.blue,
                                        size: 30.0,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Center(
                                        child: Text('Show All User'),
                                      )
                                    ]),
                              ),
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Card(
                          shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: InkWell(
                            splashColor: Colors.blue.withAlpha(30),
                            onTap: () {
                              debugPrint('card 2 tapped');
                            },
                            child: SizedBox(
                              width: 150,
                              height: 110,
                              child: Center(
                                child: ListView(
                                    shrinkWrap: true,
                                    padding: const EdgeInsets.all(20.0),
                                    children: const [
                                      Icon(
                                        Icons.edit,
                                        color: Colors.blue,
                                        size: 30.0,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Center(
                                        child: Text('Manage User'),
                                      )
                                    ]),
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 10),
                      child: Card(
                          shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: InkWell(
                            splashColor: Colors.blue.withAlpha(30),
                            onTap: () {
                              debugPrint('card 3 tapped');
                            },
                            child: const SizedBox(
                              width: 150,
                              height: 110,
                              child: Center(child: Text('Button 3')),
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Card(
                          shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: InkWell(
                            splashColor: Colors.blue.withAlpha(30),
                            onTap: () {
                              debugPrint('card 4 tapped');
                            },
                            child: const SizedBox(
                              width: 150,
                              height: 110,
                              child: Center(child: Text('Button 4')),
                            ),
                          )),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 10),
                      child: Card(
                          shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: InkWell(
                            splashColor: Colors.blue.withAlpha(30),
                            onTap: () {
                              debugPrint('card 5 tapped');
                            },
                            child: const SizedBox(
                              width: 320,
                              height: 110,
                              child: Center(child: Text('Button 5')),
                            ),
                          )),
                    ),
                  ],
                ),
              ],
            )),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (contexet) => const AddUserPage())),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
