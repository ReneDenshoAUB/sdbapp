import 'package:flutter/material.dart';

class LesseeSignatureScreen extends StatelessWidget {
  const LesseeSignatureScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lessee Signature'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("Submit"),
          onPressed: () => Navigator.pushNamed(context, '/'),
        ),
      ),
    );
  }
}
