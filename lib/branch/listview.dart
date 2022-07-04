import 'package:flutter/material.dart';

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('PENDING APPLICATIONS'),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/leaseview');
                },
                child: Text('Review'))
          ],
        ),
      ),
    );
  }
}
