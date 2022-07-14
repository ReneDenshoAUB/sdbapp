// ignore_for_file: sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sdbapp/form/fieldandlabel.dart';
import 'dart:convert';

class LeaseDetailsScreen extends StatefulWidget {
  const LeaseDetailsScreen({Key? key}) : super(key: key);

  @override
  State<LeaseDetailsScreen> createState() => LeaseDetailsScreenState();
}

class LeaseDetailsScreenState extends State<LeaseDetailsScreen> {
  static Size screenSize = WidgetsBinding.instance.window.physicalSize;
  double screenWidth = screenSize.width;
  double screenHeight = screenSize.height;
  TextEditingController branchController = TextEditingController();

  static String selectedBranch = '';
  static String selectedSize = '';
  static String annualFee = '';
  static String leaseDate = '';
  static String expiryDate = '';
  static String sdbNumber = '';
  Map<String, dynamic>? selectedBranchData;

  String? branchError;
  String? sdbNumberError;
  String? sizeError;

  List allBranchesUnparsed = [];
  List allBranches = [];
  List visibleBranches = [];

  bool branchDropdownOpened = false;
  bool sizeDropdownOpened = false;

  bool firstBuild = true;

  @override
  void initState() {
    super.initState();
    branchController.addListener(() {
      setState(() {
        visibleBranches = allBranches
            .where((x) => x.contains(branchController.text.toUpperCase()))
            .toList();
        selectedBranch = branchController.text;
      });
    });
  }

  @override
  void dispose() {
    branchController.dispose();
    super.dispose();
  }

  resetSize(String text) {
    setState(() {
      if (allBranches.contains(text)) {
        branchError = null;
      }
      selectedSize = '';
      sdbNumber = '';
      sdbNumberError = null;
      sizeError = null;
    });
  }

  toggleVisibility(String valueToChange, String pressedFrom) {
    setState(() {
      if (valueToChange == 'branch') {
        if ((pressedFrom == 'textfield' && branchDropdownOpened == false) ||
            pressedFrom != 'textfield') {
          branchDropdownOpened = !branchDropdownOpened;
        }
      } else if (valueToChange == 'size') {
        sizeDropdownOpened = !sizeDropdownOpened;
      }
    });
  }

  chooseSDBNumber(String sdbSize) {
    sdbNumber = '';
    int start = 0;
    int end = 0;

    if (sdbSize == '5x5') {
      start = 1;
      end = 5;
    } else if (sdbSize == '5x10') {
      start = 6;
      end = 10;
    } else {
      start = 11;
      end = 15;
    }

    for (int i = start; i <= end; i++) {
      if (selectedBranchData![i.toString()] == 'available') {
        setState(() {
          sdbNumber = i.toString();
          sdbNumberError = null;
          sizeError = null;
        });
        return;
      }
    }
    if (sdbNumber == '') {
      setState(() {
        sdbNumber = 'No more SDBs left. Please choose another size';
        sdbNumberError = '';
        sizeError = 'Please choose another size';
      });
    }
  }

  updateSelected(String valueToChange, String newValue) {
    setState(() {
      if (valueToChange == 'branch') {
        branchController.text = newValue;
        selectedBranch = newValue;
      } else if (valueToChange == 'size') {
        selectedSize = newValue;
        if (selectedSize == '5x5') {
          annualFee = 'PHP 880.00';
        } else if (selectedSize == '5x10') {
          annualFee = 'PHP 1,650.00';
        } else {
          annualFee = 'PHP 2,250.00';
        }
        chooseSDBNumber(selectedSize);
      }
    });
  }

  formattedDateTime() {
    var months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ];

    DateTime now = DateTime.now();
    leaseDate = "${months[now.month - 1]} ${now.day}, ${now.year}";

    //find next January
    if (now.month == 1 && now.day < 15) {
      expiryDate = 'January 15, ${now.year}';
    } else {
      expiryDate = 'January 15, ${now.year + 1}';
    }
  }

  bool formValidation() {
    bool clearToGo = true;
    setState(() {
      if (!allBranches.contains(selectedBranch)) {
        branchError = 'Please put in a valid branch';
        clearToGo = false;
      } else {
        branchError = null;
      }

      if (sdbNumber == '' && allBranches.contains(selectedBranch)) {
        sizeError = 'Please choose a size';
        sdbNumberError = '';
        clearToGo = false;
      } else if (sdbNumber == 'No more SDBs left. Please choose another size') {
        sizeError = 'Please choose another size';
        sdbNumberError = '';
        clearToGo = false;
      } else {
        sizeError = null;
        sdbNumberError = null;
      }
    });

    return clearToGo;
  }

  Future<void> readJson() async {
    final String branchResponse =
        await rootBundle.loadString('assets/json/branches.json');
    final branchData = await json.decode(branchResponse);

    allBranchesUnparsed = branchData['branches'];
    allBranches = allBranchesUnparsed
        .map((x) => '${x['Branch Code']} - ${x['Branch Name']}')
        .toList();
    visibleBranches = allBranchesUnparsed
        .map((x) => '${x['Branch Code']} - ${x['Branch Name']}')
        .toList();

    firstBuild = false;
  }

  readFromFirestore(String branch) async {
    var collection = await (FirebaseFirestore.instance.collection('branches'))
        .doc(branch)
        .get();
    selectedBranchData = collection.data();

    if (selectedBranchData != null) {
      selectedBranchData = selectedBranchData!['SDBs'];
    }
  }

  @override
  Widget build(BuildContext context) {
    if (firstBuild) {
      readJson();
      formattedDateTime();
      selectedBranch = '';
      sdbNumber = '';
      selectedSize = '';
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('SDB LEASE DETAILS'),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(screenWidth * 0.03),
            child: Column(
              children: [
                FieldAndLabel(
                    parent: this,
                    fieldType: 'DropdownSearch',
                    title: 'Branch',
                    errorText: branchError,
                    hintText: 'Enter Branch',
                    opened: branchDropdownOpened,
                    textController: branchController,
                    dropdownList: visibleBranches,
                    valueToChange: 'branch'),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: FieldAndLabel(
                          parent: this,
                          fieldType: 'Disabled',
                          title: 'SDB Number',
                          subtitle: '(Automatically chosen for you)',
                          errorText: sdbNumberError,
                          fieldText: sdbNumber,
                          valueToChange: 'sdbNumber'),
                    ),
                    SizedBox(
                      width: screenWidth * 0.03,
                    ),
                    Expanded(
                      child: FieldAndLabel(
                        parent: this,
                        fieldType: (allBranches.contains(selectedBranch))
                            ? 'Dropdown'
                            : 'Disabled',
                        title: 'Size',
                        subtitle: '',
                        errorText: sizeError,
                        fieldText: selectedSize,
                        opened: sizeDropdownOpened,
                        dropdownList: const ['5x5', '5x10', '10x10'],
                        valueToChange: 'size',
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Row(
                  children: [
                    Expanded(
                      child: FieldAndLabel(
                          parent: this,
                          fieldType: 'Disabled',
                          title: 'Annual Fee',
                          fieldText: annualFee),
                    ),
                    SizedBox(
                      width: screenWidth * 0.03,
                    ),
                    Expanded(
                      child: FieldAndLabel(
                          parent: this,
                          fieldType: 'Disabled',
                          title: 'Deposit For Keys',
                          fieldText: 'PHP 1000.00'),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Row(
                  children: [
                    Expanded(
                      child: FieldAndLabel(
                          parent: this,
                          fieldType: 'Disabled',
                          title: 'Date Leased',
                          subtitle: '(Date today)',
                          fieldText: leaseDate),
                    ),
                    SizedBox(
                      width: screenWidth * 0.03,
                    ),
                    Expanded(
                      child: FieldAndLabel(
                          parent: this,
                          fieldType: 'Disabled',
                          title: 'Expiry Date',
                          subtitle: '(The following January 15)',
                          fieldText: expiryDate),
                    ),
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      bool clearToGo = formValidation();

                      if (clearToGo) {
                        Navigator.pushNamed(context, '/leasescreen2');
                      }
                    },
                    child: const Text('press mee'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
