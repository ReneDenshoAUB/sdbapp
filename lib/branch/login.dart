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
  bool passwordVisible = false;

  static String currentUsername = '';
  static String currentPassword = '';
  static String currentType = '';

  @override
  void initState() {
    super.initState();
    passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    void getUsers() async {
      justonce = true;
      var users = await FirestoreService.readFirestore('users');
      for (var user in users) {
        usernames.add(user['username'] as String);
        userpass[user['username'] as String] = [
          user['password'] as String,
          user['type'] as String
        ];
      }
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
              width: deviceWidth * 0.4154501216,
              fit: BoxFit.fitWidth,
            ),
            SizedBox(
              height: deviceHeight * 0.0292825768,
            ),
            Text(
              'Sign In',
              style: Theme.of(context)
                  .textTheme
                  .headline3
                  ?.copyWith(fontSize: deviceWidth * 0.0875912408),
            ),
            SizedBox(
              height: deviceHeight * 0.0292825768,
            ),
            SizedBox(
              width: deviceHeight * 0.35,
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                controller: usernameController,
                style: TextStyle(
                    fontSize: deviceWidth * 0.03406326034063260,
                    height: deviceHeight * 0.00292825768667642752562225475842,
                    color: Colors.black),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: const Color(0xfff1a70e),
                        width:
                            deviceWidth * 0.00243309002433090024330900243309),
                    borderRadius: BorderRadius.circular(deviceHeight * 0.0401),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: const Color(0xfff1a70e),
                          width:
                              deviceWidth * 0.00243309002433090024330900243309),
                      borderRadius:
                          BorderRadius.circular(deviceHeight * 0.0401)),
                  labelText: 'Username',
                  labelStyle: TextStyle(
                      fontSize: deviceWidth * 0.03406326034063260,
                      color: const Color.fromARGB(255, 90, 90, 90)),
                  errorText: usernameInvalid ? 'Invalid Username' : null,
                  errorStyle:
                      TextStyle(fontSize: deviceWidth * 0.03406326034063260),
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0xfff1a70e), width: 1.0),
                    borderRadius: BorderRadius.circular(deviceHeight * 0.0401),
                  ),
                  errorBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.red, width: 2.0),
                      borderRadius:
                          BorderRadius.circular(deviceHeight * 0.0401)),
                  filled: true,
                  fillColor: Colors.white70,
                  prefixIcon: Icon(
                    FontAwesomeIcons.solidUser,
                    color: Colors.black,
                    size: deviceWidth * 0.04,
                  ),
                  contentPadding: EdgeInsets.all(deviceWidth * 0.024330900243),
                ),
              ),
            ),
            SizedBox(
              height: deviceHeight * 0.0439238653,
            ),
            SizedBox(
              width: deviceHeight * 0.35,
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                obscureText: !passwordVisible,
                controller: passwordController,
                style: TextStyle(
                    fontSize: deviceWidth * 0.03406326034063260,
                    height: deviceHeight * 0.00292825768667642752562225475842,
                    color: Colors.black),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: const Color(0xfff1a70e),
                        width:
                            deviceWidth * 0.00243309002433090024330900243309),
                    borderRadius: BorderRadius.circular(deviceHeight * 0.0401),
                  ),
                  labelText: 'Password',
                  labelStyle: TextStyle(
                      fontSize: deviceWidth * 0.03406326034063260,
                      color: const Color.fromARGB(255, 90, 90, 90)),
                  errorText: passwordInvalid ? 'Invalid password' : null,
                  errorStyle:
                      TextStyle(fontSize: deviceWidth * 0.03406326034063260),
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0xfff1a70e), width: 1.0),
                    borderRadius: BorderRadius.circular(deviceHeight * 0.0401),
                  ),
                  errorBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.red, width: 2.0),
                      borderRadius:
                          BorderRadius.circular(deviceHeight * 0.0401)),
                  focusColor: const Color(0xfff1a70e),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xfff1a70e), width: 2.0),
                      borderRadius:
                          BorderRadius.circular(deviceHeight * 0.0401)),
                  filled: true,
                  fillColor: Colors.white70,
                  prefixIcon: Icon(
                    FontAwesomeIcons.lock,
                    color: Colors.black,
                    size: deviceWidth * 0.04,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });
                    },
                    icon: Icon(
                      passwordVisible ? Icons.visibility : Icons.visibility_off,
                      color: Colors.black,
                      size: deviceWidth * 0.05,
                    ),
                  ),
                  contentPadding: EdgeInsets.all(deviceWidth * 0.024330900243),
                ),
              ),
            ),
            SizedBox(
              height: deviceHeight * 0.0439238653,
            ),
            SizedBox(
              width: deviceWidth * 0.2919708029,
              height: deviceHeight * 0.0658857979,
              child: ElevatedButton(
                onPressed: () {
                  var ucheck = usernameController.text;
                  var pcheck = passwordController.text;
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
                style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              deviceWidth * 0.068126520681),
                        ),
                      ),
                    ),
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: deviceWidth * 0.0608272506,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
