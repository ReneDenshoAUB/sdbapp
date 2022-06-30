import 'package:flutter/material.dart';
import 'package:sdbapp/services/auth.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/aubLogo.png',
              width: 200,
              fit: BoxFit.fitWidth,
            ),
            Image.asset(
              'assets/images/depositIcon.png',
              width: 190,
              fit: BoxFit.fitWidth,
            ),
            Column(
              children: [
                const SizedBox(height: 10),
                Text(
                  'Safety Deposit',
                  style: Theme.of(context).textTheme.headline3,
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Box Application',
                  style: Theme.of(context).textTheme.headline3,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 5),
                Text(
                  'Keep your valuables and documents safe',
                  style: Theme.of(context).textTheme.subtitle1,
                  textAlign: TextAlign.center,
                ),
                Text(
                  'and secure with our safety deposit boxes.',
                  style: Theme.of(context).textTheme.subtitle1,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
              child: SizedBox(
                width: 230,
                height: 55,
                child: ElevatedButton(
                  style: Theme.of(context).elevatedButtonTheme.style,
                  onPressed: () {
                    AuthService.anonLogin();
                    Navigator.pushNamed(context, '/leasescreen1');
                  },
                  child: Text(
                    'Get Started',
                    style: Theme.of(context).textTheme.button,
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
