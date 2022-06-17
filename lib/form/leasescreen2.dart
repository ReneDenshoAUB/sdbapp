import 'package:flutter/material.dart';

class LesseeDetailsScreen extends StatelessWidget {
  const LesseeDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lessee Details"),
      ),
      body: Center(
          child: ElevatedButton(
        child: const Text("Next -->"),
        onPressed: () => Navigator.pushNamed(context, '/leasescreen3'),
      )),
    );
  }
}
