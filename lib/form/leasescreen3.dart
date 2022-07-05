import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';
import 'package:sdbapp/form/leasescreen2.dart';

class LesseeSignatureScreen extends StatefulWidget {
  const LesseeSignatureScreen({Key? key}) : super(key: key);

  @override
  State<LesseeSignatureScreen> createState() => LesseeSignatureScreenState();
}

class LesseeSignatureScreenState extends State<LesseeSignatureScreen> {
  static Uint8List? signature1;
  static Uint8List? signature2;

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

  bool hasLessee2 = LesseeDetailsScreenState.hasLessee2;
  bool signature1Value = false;
  bool signature2Value = false;

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    controller1.penStrokeWidth = deviceWidth * 0.012;
    controller2.penStrokeWidth = deviceWidth * 0.012;
    return Scaffold(
      appBar: AppBar(
        title: Text('LESSEE SIGNATURE',
            style: TextStyle(fontSize: deviceHeight * 0.03134)),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: deviceWidth * 0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (signature1Value == false)
                      Padding(
                        padding: EdgeInsets.only(bottom: deviceWidth * 0.024),
                        child: Text(
                          'Lessee 1',
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.033),
                          textAlign: TextAlign.left,
                        ),
                      )
                    else
                      Row(
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(bottom: deviceWidth * 0.024),
                            child: Text(
                              'Lessee 1 ',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.033),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(bottom: deviceWidth * 0.024),
                            child: Text(
                              '- Signature Saved',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.033,
                                    fontStyle: FontStyle.italic,
                                  ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    Signature(
                      controller: controller1,
                      width: deviceWidth * 0.9,
                      height: deviceHeight * 0.2,
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
                    padding: EdgeInsets.all(deviceWidth * 0.028),
                    child: SizedBox(
                      height: deviceHeight * 0.045,
                      child: ElevatedButton(
                        onPressed: () async {
                          signature1 = await controller1.toPngBytes();
                          signature1Value = true;
                          setState(() {});
                        },
                        child: Text(
                          'Save',
                          style: TextStyle(fontSize: deviceHeight * 0.03),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(deviceWidth * 0.028),
                    child: SizedBox(
                      height: deviceHeight * 0.045,
                      child: ElevatedButton(
                        onPressed: () {
                          controller1.clear();
                        },
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(28.0),
                                side:
                                    const BorderSide(color: Color(0xffc93033))),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xffffffff)),
                        ),
                        child: Text(
                          'Clear',
                          style: TextStyle(
                              fontSize: deviceHeight * 0.03,
                              color: const Color(0xffc93033)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              /*if (signature1 != null)
                SizedBox(
                  height: 150,
                  child: Stack(children: [
                    Center(child: Image.memory(signature1!)),
                    Center(child: Image.asset('assets/images/sigholder1.png')),
                  ]),
                ),*/
              if (hasLessee2 == true)
                SizedBox(
                  width: deviceWidth * 0.9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (signature2Value == false)
                        Padding(
                          padding: EdgeInsets.fromLTRB(0.0, deviceWidth * 0.00,
                              0.0, deviceWidth * 0.024),
                          child: Text(
                            'Lessee 2',
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.033),
                          ),
                        )
                      else
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0.0,
                                  deviceWidth * 0.00, 0.0, deviceWidth * 0.024),
                              child: Text(
                                'Lessee 2',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    ?.copyWith(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.033),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0.0,
                                  deviceWidth * 0.00, 0.0, deviceWidth * 0.02),
                              child: Text('- Signature Saved',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      ?.copyWith(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.033,
                                          fontStyle: FontStyle.italic)),
                            ),
                          ],
                        ),
                      Signature(
                        controller: controller2,
                        width: deviceWidth * 0.9,
                        height: deviceHeight * 0.2,
                        backgroundColor: const Color(0xffeae0d6),
                      ),
                    ],
                  ),
                ),
              if (hasLessee2 == true)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(deviceWidth * 0.028),
                      child: SizedBox(
                        height: deviceHeight * 0.045,
                        child: ElevatedButton(
                          onPressed: () async {
                            signature2 = await controller2.toPngBytes();
                            signature2Value = true;
                            setState(() {});
                          },
                          child: Text(
                            'Save',
                            style: TextStyle(fontSize: deviceHeight * 0.03),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(deviceWidth * 0.028),
                      child: SizedBox(
                        height: deviceHeight * 0.045,
                        child: ElevatedButton(
                          onPressed: () {
                            controller2.clear();
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(28.0),
                                  side: const BorderSide(
                                      color: Color(0xffc93033))),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color(0xffffffff)),
                          ),
                          child: Text(
                            'Clear',
                            style: TextStyle(
                                fontSize: deviceHeight * 0.03,
                                color: const Color(0xffc93033)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              /*if (signature2 != null)
                SizedBox(
                  height: 150,
                  child: Stack(children: [
                    Center(child: Image.memory(signature2!)),
                    Center(child: Image.asset('assets/images/sigholder2.png')),
                  ]),
                ),*/
              SizedBox(height: deviceWidth * 0.03),
              Text(
                'Review your lease details before submitting.',
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontSize: MediaQuery.of(context).size.height * 0.02),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.007,
              ),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: ElevatedButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Next "),
                        Icon(
                          Icons.arrow_circle_right,
                          size: deviceHeight * 0.015,
                        ),
                      ],
                    ),
                    onPressed: () {
                      if (signature1Value == false) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Lessee 1 needs to sign')));
                      } else if (hasLessee2 == true &&
                          signature2Value == false) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Lessee 2 needs to sign')));
                      } else {
                        Navigator.pushNamed(context, '/leasescreen4');
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
