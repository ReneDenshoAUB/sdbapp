import 'package:flutter/material.dart';

class LeaseViewScreeen extends StatelessWidget {
  const LeaseViewScreeen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final leasedetails =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
        body: Center(
      child: Text('$leasedetails\n'),
    ));
  }
}
