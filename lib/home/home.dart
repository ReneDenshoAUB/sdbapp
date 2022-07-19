import 'package:flutter/material.dart';
import 'package:sdbapp/services/auth.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(right: deviceWidth * 0.03649635),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(bottom: deviceWidth * 0.00729927),
                      child: Text(
                        "For employees:",
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(fontSize: deviceWidth * 0.0316301703),
                      ),
                    ),
                    SizedBox(
                      width: deviceWidth * 0.1993187347,
                      height: deviceHeight * 0.03660322,
                      child: ElevatedButton(
                        child: Text(
                          'Sign in',
                          style: TextStyle(fontSize: deviceHeight * 0.0184),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Image.asset(
              'assets/images/aubLogo.png',
              width: deviceHeight * 0.2928,
              fit: BoxFit.fitWidth,
            ),
            Image.asset(
              'assets/images/depositIcon.png',
              width: deviceHeight * 0.2782,
              fit: BoxFit.fitWidth,
            ),
            Column(
              children: [
                SizedBox(height: deviceHeight * 0.01464),
                Text(
                  'Safety Deposit',
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      ?.copyWith(fontSize: deviceHeight * 0.05271),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Box Application',
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      ?.copyWith(fontSize: deviceHeight * 0.05271),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: deviceHeight * 0.00732),
                Text(
                  'Keep your valuables and documents safe',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(fontSize: deviceHeight * 0.019),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'and secure with our safety deposit boxes.',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(fontSize: deviceHeight * 0.019),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Padding(
              padding:
                  EdgeInsets.fromLTRB(0.0, deviceHeight * 0.0732, 0.0, 0.0),
              child: SizedBox(
                width: deviceHeight * 0.3367,
                height: deviceHeight * 0.0862,
                child: ElevatedButton(
                  style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(deviceHeight * 0.0401),
                          ),
                        ),
                      ),
                  onPressed: () {
                    AuthService.anonLogin();
                    Navigator.pushNamed(context, '/leasescreen1');
                  },
                  child: Text(
                    'Get Started',
                    style: Theme.of(context)
                        .textTheme
                        .button
                        ?.copyWith(fontSize: deviceHeight * 0.0429),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
