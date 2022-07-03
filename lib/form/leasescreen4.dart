import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sdbapp/form/leasescreen2.dart';
import 'package:sdbapp/form/leasescreen1.dart';
import 'package:sdbapp/form/leasescreen3.dart';

class LeaseReviewScreen extends StatefulWidget {
  const LeaseReviewScreen({Key? key}) : super(key: key);

  @override
  State<LeaseReviewScreen> createState() => _LeaseReviewScreenState();
}

class _LeaseReviewScreenState extends State<LeaseReviewScreen> {
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

  bool hasLessee2 = LesseeDetailsScreenState.hasLessee2;
  bool checkboxValue = false;

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
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
          title: Text('Lease Review',
              style: TextStyle(fontSize: deviceHeight * 0.03134))),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                  0.0, deviceHeight * 0.03, 0.0, deviceHeight * 0.03134),
              child: Text(
                'SDB LEASE DETAILS',
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(fontSize: deviceHeight * 0.0366),
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
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(fontSize: deviceHeight * 0.02342),
                      ),
                      Text(
                        branch,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(fontSize: deviceHeight * 0.02049),
                      ),
                      SizedBox(height: deviceHeight * 0.00732),
                      Text(
                        'Annual Fee',
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(fontSize: deviceHeight * 0.02342),
                      ),
                      Text(
                        annualfee,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(fontSize: deviceHeight * 0.02049),
                      ),
                      SizedBox(height: deviceHeight * 0.00732),
                      Text(
                        'Lease Date',
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(fontSize: deviceHeight * 0.02342),
                      ),
                      Text(
                        dateleased,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(fontSize: deviceHeight * 0.02049),
                      ),
                      SizedBox(height: deviceHeight * 0.00732),
                      Text(
                        'Size',
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(fontSize: deviceHeight * 0.02342),
                      ),
                      Text(
                        size,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(fontSize: deviceHeight * 0.02049),
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
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(fontSize: deviceHeight * 0.02342),
                      ),
                      Text(
                        sdbnumber,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(fontSize: deviceHeight * 0.02049),
                      ),
                      SizedBox(height: deviceHeight * 0.00732),
                      Text(
                        'Deposit For Keys',
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(fontSize: deviceHeight * 0.02342),
                      ),
                      Text(
                        depositfee,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(fontSize: deviceHeight * 0.02049),
                      ),
                      SizedBox(height: deviceHeight * 0.00732),
                      Text(
                        'Expiry Date',
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(fontSize: deviceHeight * 0.02342),
                      ),
                      Text(
                        expirydate,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(fontSize: deviceHeight * 0.02049),
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
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(fontSize: deviceHeight * 0.0366),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    'Lessee 1',
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        ?.copyWith(fontSize: deviceHeight * 0.0366),
                  ),
                  SizedBox(height: deviceHeight * 0.00732),
                  Text(
                    'Name',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(fontSize: deviceHeight * 0.02342),
                  ),
                  Text(
                    lessee1,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(fontSize: deviceHeight * 0.02049),
                  ),
                  SizedBox(height: deviceHeight * 0.00732),
                  Text(
                    'Address',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(fontSize: deviceHeight * 0.02342),
                  ),
                  Text(
                    address1,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(fontSize: deviceHeight * 0.02049),
                  ),
                  SizedBox(height: deviceHeight * 0.00732),
                  Text(
                    'Contact Number',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(fontSize: deviceHeight * 0.02342),
                  ),
                  Text(
                    contact1,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(fontSize: deviceHeight * 0.02049),
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
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          ?.copyWith(fontSize: deviceHeight * 0.0366),
                    ),
                    SizedBox(height: deviceHeight * 0.00732),
                    Text(
                      'Name',
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          ?.copyWith(fontSize: deviceHeight * 0.02342),
                    ),
                    Text(
                      lessee2,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(fontSize: deviceHeight * 0.02049),
                    ),
                    SizedBox(height: deviceHeight * 0.00732),
                    Text(
                      'Address',
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          ?.copyWith(fontSize: deviceHeight * 0.02342),
                    ),
                    Text(
                      address2,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(fontSize: deviceHeight * 0.02049),
                    ),
                    SizedBox(height: deviceHeight * 0.00732),
                    Text(
                      'Contact Number',
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          ?.copyWith(fontSize: deviceHeight * 0.02342),
                    ),
                    Text(
                      contact2,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(fontSize: deviceHeight * 0.02049),
                    ),
                  ],
                ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Transform.scale(
                  scale: 1.5,
                  child: Checkbox(
                      value: checkboxValue,
                      onChanged: (value) {
                        setState(() {
                          checkboxValue = value!;
                        });
                      }),
                ),
                Text('By continuing, you agree to our ',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.02)),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(deviceHeight * 0.03))),
                            title: Text(
                              'Terms of Use',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  ?.copyWith(fontSize: deviceHeight * 0.0366),
                              textAlign: TextAlign.center,
                            ),
                            content: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Divider(
                                      color: Colors.grey, height: 4.0),
                                  Text(
                                      '\nPlease read these Terms of Use carefully before using this mobile app. Using this mobile app means you have read, understood, and accepted these Terms of Use. If you do not accept these Terms of Use, do not use this mobile app.',
                                      style: TextStyle(
                                          fontSize: deviceHeight * 0.02)),
                                  Text(
                                    '\nCHANGES TO THIS TERMS OF USE',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        ?.copyWith(
                                            fontSize: deviceHeight * 0.02342),
                                  ),
                                  Text(
                                      '\nAUB reserves the right to change this Terms of Use from time to time, in whole or in part, without notice to you. You should check back often so you are aware of your current rights and responsibilities. Your continued use of this mobile app after changes to the Terms of Use have been published constitutes your binding acceptance of the updated Terms of Use. If at any time the Terms of Use are not acceptable to you, you should immediately cease all use of this mobile app.',
                                      style: TextStyle(
                                          fontSize: deviceHeight * 0.02)),
                                  Text(
                                    '\nTRADEMARKS',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        ?.copyWith(
                                            fontSize: deviceHeight * 0.02342),
                                  ),
                                  Text(
                                      '\nThe trademarks, logos, and service marks displayed on this mobile app are the property of AUB or their respective owners. You are not permitted to use these items without the prior written consent of AUB or their respective owners.',
                                      style: TextStyle(
                                          fontSize: deviceHeight * 0.02)),
                                  Text(
                                    '\nCOPYRIGHTS',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        ?.copyWith(
                                            fontSize: deviceHeight * 0.02342),
                                  ),
                                  Text(
                                      '\nAUB either owns the intellectual property rights in the content that is made available on this mobile app, or has obtained the permission of the owner to make it available on this mobile app. AUB strictly prohibits the redistribution or copying of this mobile app, in whole or in part, without written permission from AUB. AUB authorizes you to display on your computer, download, or print the pages from this mobile app provided:',
                                      style: TextStyle(
                                          fontSize: deviceHeight * 0.02)),
                                  Text(
                                      '\na. The copyright notice appears on all printouts.',
                                      style: TextStyle(
                                          fontSize: deviceHeight * 0.02)),
                                  Text(
                                      '\nb. The information is intact and will not be altered in any way.',
                                      style: TextStyle(
                                          fontSize: deviceHeight * 0.02)),
                                  Text(
                                      '\nc. The content is used for personal, educational, or non-commercial use only.',
                                      style: TextStyle(
                                          fontSize: deviceHeight * 0.02)),
                                  Text(
                                      '\nd. You do not redistribute or copy the information to any other media.',
                                      style: TextStyle(
                                          fontSize: deviceHeight * 0.02)),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(
                                      fontSize: deviceHeight * 0.02635,
                                      color: const Color(0xffc93033)),
                                ),
                              ),
                              SizedBox(
                                height: deviceHeight * 0.04,
                                child: ElevatedButton(
                                  onPressed: () {
                                    checkboxValue = true;
                                    Navigator.pop(context);
                                    setState(() {});
                                  },
                                  child: Text(
                                    'ACCEPT',
                                    style: TextStyle(
                                        fontSize: deviceHeight * 0.02635),
                                  ),
                                ),
                              ),
                            ],
                          );
                        });
                  },
                  child: Text(
                    'Terms and Conditions',
                    style: TextStyle(
                        color: const Color(0xffc93033),
                        fontFamily: 'Gilroy',
                        fontSize: deviceHeight * 0.02),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: deviceHeight * 0.06569,
              width: deviceWidth * 0.3406,
              child: ElevatedButton(
                style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(deviceHeight * 0.04099),
                    ))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Submit ",
                      style: TextStyle(fontSize: deviceHeight * 0.03513),
                    ),
                    Icon(
                      FontAwesomeIcons.solidPaperPlane,
                      size: deviceHeight * 0.02928,
                    ),
                  ],
                ),
                onPressed: () {
                  if (checkboxValue == false) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Need to accept terms')));
                  } else {
                    lease.signature1 = LesseeSignatureScreenState.signature1;
                    if (hasLessee2 == true) {
                      lease.signature2 = LesseeSignatureScreenState.signature2;
                    }
                    Navigator.pushNamed(context, '/successscreen',
                        arguments: lease);
                  }
                },
              ),
            ),
            SizedBox(height: deviceHeight * 0.04392386530014641288433382137628),
          ],
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
