import 'package:flutter/material.dart';

class BranchSuccess extends StatefulWidget {
  const BranchSuccess({Key? key}) : super(key: key);

  @override
  State<BranchSuccess> createState() => _BranchSuccessState();
}

class _BranchSuccessState extends State<BranchSuccess> {

  Text buildMessage (String action) {

    if (action == 'approver') {
      return Text(
        'Lease successfully approved',
        style: Theme.of(context).textTheme.headline6,
      );
    } else if (action == 'verifier') {
      return Text(
        'Lease successfully endorsed',
        style: Theme.of(context).textTheme.headline6,
      );
    } else {
      return Text(
        'Lease successfully rejected',
        style: Theme.of(context).textTheme.headline6,
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    String action = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: const AssetImage('assets/images/aubLogo.png'),
              width: MediaQuery.of(context).size.width * 0.8,
            ),
            buildMessage(action),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/listview', (route) => false);
                },
                child: const Text('Back to list')),
          ],
        ),
      ),
    );
  }
}
