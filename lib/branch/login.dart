import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sdbapp/services/firestore.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  bool justonce = false;

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    List<String> usernames = [];
    Map<String, String> userpass = <String, String>{};

    void getUsers() async {
      justonce = true;
      var users = await FirestoreService.readUsers();
      print(users);
      for (var user in users) {
        usernames.add(user['username'] as String);
        userpass[user['username'] as String] = user['password'] as String;
      }
      print(usernames);
      print(userpass);
    }

    if (justonce == false) getUsers();
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: deviceHeight * 0.35,
            height: 50,
            child: TextField(
              controller: usernamecontroller,
              style:
                  TextStyle(fontSize: 14.0, height: 2.0, color: Colors.black),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(deviceHeight * 0.0401),
                ),
                labelText: 'Username',
                filled: true,
                fillColor: Colors.white70,
                prefixIcon: Icon(FontAwesomeIcons.solidUser),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/listview');
            },
            child: Text('Login'),
          ),
        ],
      ),
    ));
  }
}
