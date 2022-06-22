import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:sdbapp/themes.dart';
import 'package:signature/signature.dart';

class LesseeSignatureScreen extends StatefulWidget {
  const LesseeSignatureScreen({Key? key}) : super(key: key);

  @override
  State<LesseeSignatureScreen> createState() => _LesseeSignatureScreenState();
}

class _LesseeSignatureScreenState extends State<LesseeSignatureScreen> {
  Uint8List? signature1;
  Uint8List? signature2;

  SignatureController controller1 = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );

  SignatureController controller2 = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lessee Signature'),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25.0, 20.0, 0.0, 10.0),
                    child: Text(
                      'Lessee 1',
                      style: Theme.of(context).textTheme.headline5,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
              Signature(
                controller: controller1,
                width: 350,
                height: 150,
                backgroundColor: const Color(0xffeae0d6),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        signature1 = await controller1.toPngBytes();
                        setState(() {});
                      },
                      child: const Text(
                        'Save',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                    child: ElevatedButton(
                      onPressed: () {
                        controller1.clear();
                      },
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28.0),
                              side: const BorderSide(color: Color(0xffc93033))),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xffffffff)),
                      ),
                      child: const Text(
                        'Clear',
                        style:
                            TextStyle(fontSize: 20, color: Color(0xffc93033)),
                      ),
                    ),
                  ),
                ],
              ),
              if (signature1 != null)
                SizedBox(
                  height: 150,
                  child: Stack(children: [
                    Center(child: Image.memory(signature1!)),
                    Center(child: Image.asset('assets/images/sigholder1.png')),
                  ]),
                ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25.0, 20.0, 0.0, 10.0),
                    child: Text(
                      'Lessee 2',
                      style: Theme.of(context).textTheme.headline5,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
              Signature(
                controller: controller2,
                width: 350,
                height: 150,
                backgroundColor: const Color(0xffeae0d6),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        signature2 = await controller2.toPngBytes();
                        setState(() {});
                      },
                      child: const Text(
                        'Save',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                    child: ElevatedButton(
                      onPressed: () {
                        controller2.clear();
                      },
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28.0),
                              side: const BorderSide(color: Color(0xffc93033))),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xffffffff)),
                      ),
                      child: const Text(
                        'Clear',
                        style:
                            TextStyle(fontSize: 20, color: Color(0xffc93033)),
                      ),
                    ),
                  ),
                ],
              ),
              if (signature2 != null)
                SizedBox(
                  height: 150,
                  child: Stack(children: [
                    Center(child: Image.memory(signature2!)),
                    Center(child: Image.asset('assets/images/sigholder2.png')),
                  ]),
                ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 20.0),
                child: Text(
                  'SDB Lease Details',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              ElevatedButton(
                child: const Text(
                  "Submit",
                  style: TextStyle(fontSize: 24),
                ),
                onPressed: () => Navigator.pushNamed(context, '/'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
