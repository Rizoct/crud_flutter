import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_flutter_tes/components/primarybutton.dart';
import 'package:crud_flutter_tes/components/primarytextfield.dart';
import 'package:crud_flutter_tes/screens/mainmenu.dart';
import 'package:crud_flutter_tes/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(title: 'Main Menu'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
          child: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          CircleAvatar(
            radius: 100,
            child: ClipRRect(
              child: Image.asset("assets/1.png"),
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
          Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              PrimaryTextfield(hint: 'Email', controller: emailController),
              PrimaryTextfield(
                  hint: 'Password', controller: passwordController),
              const SizedBox(
                height: 40,
              ),
              PrimaryButton(
                  text: 'Login',
                  navigate: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainMenuPage()))),
              const SizedBox(
                height: 20,
              ),
              PrimaryButton(
                  text: 'Register',
                  navigate: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegisterPage()))),
            ],
          ),

          /*
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MainMenuPage()));
              },
              child: Text('OwO')), */
        ],
      )),
    );
  }
}
