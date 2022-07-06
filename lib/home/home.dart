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
              width: MediaQuery.of(context).size.width * 0.3,
              fit: BoxFit.fitWidth,
            ),
            Image.asset(
              'assets/images/depositIcon.png',
              width: MediaQuery.of(context).size.width * 0.3,
              fit: BoxFit.fitWidth,
            ),
            const SizedBox(height: 10),
            Text(
              'Safety Deposit\nBox Application',
              style: Theme.of(context).textTheme.headline3?.copyWith(fontSize: MediaQuery.of(context).size.height * 0.05),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),
            Text(
              'Keep your valuables and documents safe\nand secure with our safety deposit boxes.',
              style: Theme.of(context).textTheme.subtitle1?.copyWith(fontSize: MediaQuery.of(context).size.height * 0.02),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.height * 0.05,
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
