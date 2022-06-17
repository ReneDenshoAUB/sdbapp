import 'package:flutter/material.dart';

class LeaseDetailsScreen extends StatelessWidget {
  const LeaseDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('SDB Lease Details'),
        ),
        body: Center(
          child: ElevatedButton(
            child: const Text('Next -->'),
            onPressed: () => Navigator.pushNamed(context, '/leasescreen2'),
          ),
        ));
  }
}
