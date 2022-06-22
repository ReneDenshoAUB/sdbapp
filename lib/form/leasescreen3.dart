import 'dart:typed_data';

import 'package:flutter/material.dart';
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
              SizedBox(
                width: 350,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                      child: Text(
                        'Lessee 1',
                        style: Theme.of(context).textTheme.headline5,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Signature(
                      controller: controller1,
                      width: 350,
                      height: 150,
                      backgroundColor: const Color(0xffeae0d6),
                    ),
                  ],
                ),
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
                        controller1.clear();
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
              SizedBox(
                width: 350,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                      child: Text(
                        'Lessee 2',
                        style: Theme.of(context).textTheme.headline5,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Signature(
                      controller: controller2,
                      width: 350,
                      height: 150,
                      backgroundColor: const Color(0xffeae0d6),
                    ),
                  ],
                ),
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
                        controller2.clear();
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
                  'SDB LEASE DETAILS',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Branch',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Text(
                          'AUB Better Living Branch',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'SDB Number',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Text(
                          '38',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Size',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Text(
                          '5 X 10',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Annual Fee',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Text(
                          'PHP 1,650.00',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Deposit For Keys',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Text(
                          'PHP 1,000.00',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lease Date',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Text(
                          'June 17, 2022',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Expiry Date',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Text(
                          'January 15, 2023',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 20.0),
                child: Text(
                  'LESSEE DETAILS',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      'Lessee 1',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Name',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Text(
                      'Rene Lee T. Aquitania',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Address',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(
                      'A-154 Poblacion La Trinidad, Benguet 2601',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Contact Number',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(
                      '+639771704267',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 30.0),
                child: Column(
                  children: [
                    Text(
                      'Lessee 2',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Name',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Text(
                      'Rene Lee T. Aquitania',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Address',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(
                      'A-154 Poblacion La Trinidad, Benguet 2601',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Contact Number',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(
                      '+639771704267',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  child: const Text(
                    "Submit",
                    style: TextStyle(fontSize: 24),
                  ),
                  onPressed: () => Navigator.pushNamed(context, '/'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
