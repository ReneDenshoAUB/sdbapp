import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
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
          Padding(
            padding: const EdgeInsets.fromLTRB(70.0, 10.0, 70.0, 5.0),
            child: Text(
              'Safety Deposit Box Application',
              style: Theme.of(context).textTheme.headline3,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(70.0, 0.0, 70.0, 0.0),
            child: Text(
              'Keep your valuables and documents safe and secure with our safety deposit boxes.',
              style: Theme.of(context).textTheme.subtitle1,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
            child: SizedBox(
              width: 230,
              height: 55,
              child: ElevatedButton(
                style: Theme.of(context).elevatedButtonTheme.style,
                onPressed: () => Navigator.pushNamed(context, '/leasescreen1'),
                child: Text(
                  'Get Started',
                  style: Theme.of(context).textTheme.button,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
