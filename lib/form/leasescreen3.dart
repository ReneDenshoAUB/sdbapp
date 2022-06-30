import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:signature/signature.dart';
import 'package:sdbapp/form/leasescreen1.dart';
import 'package:sdbapp/form/leasescreen2.dart';

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

  bool hasLessee2 = LesseeDetailsScreenState.hasLessee2;
  bool signature1Value = false;
  bool signature2Value = false;
  bool checkboxValue = false;

  String branch = LeaseDetailsScreenState.selectedBranch.value;
  String sdbnumber = '38';
  String size = LeaseDetailsScreenState.selectedSize.value;
  String annualfee = LeaseDetailsScreenState.selectedPrice;
  String depositfee = 'PHP 1,000.00';
  String dateleased = LeaseDetailsScreenState.dateleased;
  String expirydate = LeaseDetailsScreenState.expirydate;
  String lessee1 =
      '${LesseeDetailsScreenState.fName1} ${LesseeDetailsScreenState.mName1} ${LesseeDetailsScreenState.lName1}';
  String address1 =
      '${LesseeDetailsScreenState.house1} ${LesseeDetailsScreenState.barangay1.value} ${LesseeDetailsScreenState.city1.value} ${LesseeDetailsScreenState.province1.value}';
  String contact1 = LesseeDetailsScreenState.contact1;
  String lessee2 =
      '${LesseeDetailsScreenState.fName2} ${LesseeDetailsScreenState.mName2} ${LesseeDetailsScreenState.lName2}';
  String address2 =
      '${LesseeDetailsScreenState.house2} ${LesseeDetailsScreenState.barangay2.value} ${LesseeDetailsScreenState.city2.value} ${LesseeDetailsScreenState.province2.value}';
  String contact2 = LesseeDetailsScreenState.contact2;
  String? sigurl1;
  String? sigurl2;

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    Lease lease = Lease(
      branch: branch,
      sdbnumber: sdbnumber,
      size: size,
      annualfee: annualfee,
      depositfee: depositfee,
      dateleased: dateleased,
      expirydate: expirydate,
      lessee1: lessee1,
      address1: address1,
      contact1: contact1,
    );
    if (hasLessee2 == true) {
      lease.lessee2 = lessee2;
      lease.address2 = address2;
      lease.contact2 = contact2;
    }
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
                        signature1Value = true;
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
              if (hasLessee2 == true)
                SizedBox(
                  width: 350,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
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
              if (hasLessee2 == true)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                      child: ElevatedButton(
                        onPressed: () async {
                          signature2 = await controller2.toPngBytes();
                          signature2Value = true;
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
                                side:
                                    const BorderSide(color: Color(0xffc93033))),
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
              if (deviceWidth > 450)
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
                            branch,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'SDB Number',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Text(
                            sdbnumber,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Size',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Text(
                            size,
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
                            annualfee,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Deposit For Keys',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Text(
                            depositfee,
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
                            dateleased,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Expiry Date',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Text(
                            expirydate,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              else
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
                            branch,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Annual Fee',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Text(
                            annualfee,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Lease Date',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Text(
                            dateleased,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Size',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Text(
                            size,
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
                            'SDB Number',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Text(
                            sdbnumber,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Deposit For Keys',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Text(
                            depositfee,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Expiry Date',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Text(
                            expirydate,
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
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Name',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(
                      lessee1,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Address',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(
                      address1,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Contact Number',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(
                      contact1,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
              ),
              if (hasLessee2 == true)
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 30.0),
                  child: Column(
                    children: [
                      Text(
                        'Lessee 2',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Name',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      Text(
                        lessee2,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Address',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      Text(
                        address2,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Contact Number',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      Text(
                        contact2,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Checkbox(
                      value: checkboxValue,
                      onChanged: (value) {
                        setState(() {
                          checkboxValue = value!;
                        });
                      }),
                  const Text('By continuing, you agree to our '),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(28.0))),
                              title: Text(
                                'Terms of Use',
                                style: Theme.of(context).textTheme.headline5,
                                textAlign: TextAlign.center,
                              ),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Divider(
                                        color: Colors.grey, height: 4.0),
                                    const Text(
                                        '\nPlease read these Terms of Use carefully before using this mobile app. Using this mobile app means you have read, understood, and accepted these Terms of Use. If you do not accept these Terms of Use, do not use this mobile app.'),
                                    Text(
                                      '\nCHANGES TO THIS TERMS OF USE',
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                    ),
                                    const Text(
                                        '\nAUB reserves the right to change this Terms of Use from time to time, in whole or in part, without notice to you. You should check back often so you are aware of your current rights and responsibilities. Your continued use of this mobile app after changes to the Terms of Use have been published constitutes your binding acceptance of the updated Terms of Use. If at any time the Terms of Use are not acceptable to you, you should immediately cease all use of this mobile app.'),
                                    Text(
                                      '\nTRADEMARKS',
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                    ),
                                    const Text(
                                        '\nThe trademarks, logos, and service marks displayed on this mobile app are the property of AUB or their respective owners. You are not permitted to use these items without the prior written consent of AUB or their respective owners.'),
                                    Text(
                                      '\nCOPYRIGHTS',
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                    ),
                                    const Text(
                                        '\nAUB either owns the intellectual property rights in the content that is made available on this mobile app, or has obtained the permission of the owner to make it available on this mobile app. AUB strictly prohibits the redistribution or copying of this mobile app, in whole or in part, without written permission from AUB. AUB authorizes you to display on your computer, download, or print the pages from this mobile app provided:'),
                                    const Text(
                                        '\na. The copyright notice appears on all printouts.'),
                                    const Text(
                                        '\nb. The information is intact and will not be altered in any way.'),
                                    const Text(
                                        '\nc. The content is used for personal, educational, or non-commercial use only.'),
                                    const Text(
                                        '\nd. You do not redistribute or copy the information to any other media.'),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    'Cancel',
                                    style: TextStyle(
                                        fontSize: 18, color: Color(0xffc93033)),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    checkboxValue = true;
                                    Navigator.pop(context);
                                    setState(() {});
                                  },
                                  child: const Text(
                                    'ACCEPT',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                              ],
                            );
                          });
                    },
                    child: const Text(
                      'Terms and Conditions',
                      style: TextStyle(
                          color: Color(0xffc93033),
                          fontFamily: 'Gilroy',
                          fontSize: 12.0),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 45.0,
                width: 150.0,
                child: ElevatedButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Submit ",
                        style: TextStyle(fontSize: 24),
                      ),
                      Icon(
                        FontAwesomeIcons.solidPaperPlane,
                        size: 20.0,
                      ),
                    ],
                  ),
                  onPressed: () {
                    if (signature1Value == false) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Lessee 1 needs to sign')));
                    } else if (hasLessee2 == true && signature2Value == false) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Lessee 2 needs to sign')));
                    } else if (checkboxValue == false) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Need to accept terms')));
                    } else {
                      lease.signature1 = signature1;
                      if (hasLessee2 == true) lease.signature2 = signature2;
                      Navigator.pushNamed(context, '/successscreen',
                          arguments: lease);
                    }
                  },
                ),
              ),
              const SizedBox(height: 30.0),
            ],
          ),
        ),
      ),
    );
  }
}

class Lease {
  final String branch;
  final String sdbnumber;
  final String size;
  final String annualfee;
  final String depositfee;
  final String dateleased;
  final String expirydate;
  final String lessee1;
  final String address1;
  final String contact1;
  String lessee2;
  String address2;
  String contact2;
  Uint8List? signature1;
  Uint8List? signature2;
  String? sigurl1;
  String? sigurl2;

  Lease({
    this.branch = '',
    this.sdbnumber = '',
    this.size = '',
    this.annualfee = '',
    this.depositfee = '',
    this.dateleased = '',
    this.expirydate = '',
    this.lessee1 = '',
    this.address1 = '',
    this.contact1 = '',
    this.lessee2 = '',
    this.address2 = '',
    this.contact2 = '',
  });
}
