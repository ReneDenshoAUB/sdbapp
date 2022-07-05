import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sdbapp/services/firestore.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  List<String> usernames = [];
  Map<String, List<String>> userpass = <String, List<String>>{};
  bool justonce = false;
  bool usernameInvalid = false;
  bool passwordInvalid = false;

  static String currentUsername = '';
  static String currentPassword = '';
  static String currentType = '';

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;

    void getUsers() async {
      justonce = true;
      var users = await FirestoreService.readUsers();
      print(users);
      for (var user in users) {
        usernames.add(user['username'] as String);
        userpass[user['username'] as String] = [
          user['password'] as String,
          user['type'] as String
        ];
      }
      print(usernames);
      print(userpass);
    }

    if (justonce == false) getUsers();

    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/aubLogo.png',
                width: deviceHeight * 0.25,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Sign In',
                style: Theme.of(context).textTheme.headline3,
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: deviceHeight * 0.35,
                child: TextField(
                  controller: usernameController,
                  style: TextStyle(
                      fontSize: 14.0, height: 2.0, color: Colors.black),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xfff1a70e), width: 1.0),
                      borderRadius:
                          BorderRadius.circular(deviceHeight * 0.0401),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xfff1a70e), width: 2.0),
                        borderRadius:
                            BorderRadius.circular(deviceHeight * 0.0401)),
                    labelText: 'Username',
                    labelStyle:
                        TextStyle(color: Color.fromARGB(255, 90, 90, 90)),
                    errorText: usernameInvalid ? 'Wrong Username' : null,
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xfff1a70e), width: 1.0),
                      borderRadius:
                          BorderRadius.circular(deviceHeight * 0.0401),
                    ),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 2.0),
                        borderRadius:
                            BorderRadius.circular(deviceHeight * 0.0401)),
                    filled: true,
                    fillColor: Colors.white70,
                    prefixIcon: Icon(
                      FontAwesomeIcons.solidUser,
                      color: Colors.black,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: deviceHeight * 0.35,
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  style: TextStyle(
                      fontSize: 14.0, height: 2.0, color: Colors.black),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xfff1a70e), width: 1.0),
                      borderRadius:
                          BorderRadius.circular(deviceHeight * 0.0401),
                    ),
                    labelText: 'Password',
                    labelStyle:
                        TextStyle(color: Color.fromARGB(255, 90, 90, 90)),
                    errorText: passwordInvalid ? 'Wrong password' : null,
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xfff1a70e), width: 1.0),
                      borderRadius:
                          BorderRadius.circular(deviceHeight * 0.0401),
                    ),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 2.0),
                        borderRadius:
                            BorderRadius.circular(deviceHeight * 0.0401)),
                    focusColor: Color(0xfff1a70e),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xfff1a70e), width: 2.0),
                        borderRadius:
                            BorderRadius.circular(deviceHeight * 0.0401)),
                    filled: true,
                    fillColor: Colors.white70,
                    prefixIcon: Icon(
                      FontAwesomeIcons.lock,
                      color: Colors.black,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 120,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    var ucheck = usernameController.text;
                    print(ucheck);
                    var pcheck = passwordController.text;
                    print(pcheck);
                    print(usernames);
                    if (usernames.contains(ucheck)) {
                      if (userpass[ucheck]![0] == pcheck) {
                        currentUsername = ucheck;
                        currentPassword = pcheck;
                        currentType = userpass[ucheck]![1];
                        Navigator.pushNamed(context, '/listview');
                      } else {
                        setState(() {
                          passwordInvalid = true;
                        });
                      }
                    } else {
                      setState(() {
                        usernameInvalid = true;
                      });
                    }
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
