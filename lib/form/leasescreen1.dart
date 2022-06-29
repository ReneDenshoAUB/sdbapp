// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'formandlabel.dart';
import 'fieldattributes.dart';

class LeaseDetailsScreen extends StatefulWidget {
  const LeaseDetailsScreen({Key? key}) : super(key: key);

  @override
  State<LeaseDetailsScreen> createState() => _LeaseDetailsScreenState();
}

class _LeaseDetailsScreenState extends State<LeaseDetailsScreen> {
  //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController branchController = TextEditingController();
  ValueNotifier<String> selectedSize = ValueNotifier<String>('');
  ValueNotifier<String> selectedBranch = ValueNotifier<String>('');
  List<String> sizes = ['5x5', '5x10', '10x10', '10x15', '15x15'];
  List<String> allBranches = [
    'Branch 1',
    'Branch 13',
    'Branch 2',
    'Branch 4',
    'Branch 5',
    'Branch 553'
  ];
  List<String> branchArray = [
    'Branch 1',
    'Branch 13',
    'Branch 2',
    'Branch 4',
    'Branch 5',
    'Branch 553'
  ];

  @override
  void initState() {
    super.initState();
    branchController.addListener(() {
      /*
      setState(() {
        branchArray = allBranches.where((branch) {
          final branchLower = branch.toLowerCase();
          final searchLower = branchController.text.toLowerCase();

          return branchLower.contains(searchLower);
        }).toList();
      });

      print(branchArray);
      selectedSize.value = branchController.text;
      print(branchController.text);
      */
    });
  }

  @override
  void dispose() {
    branchController.dispose();
    super.dispose();
  }

  String formattedDateTime() {
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
    return "${months[now.month - 1]} ${now.day}, ${now.year}";
  }

  String nextJanuary() {
    DateTime now = DateTime.now();

    if (now.month == 1 && now.day < 15) {
      return "January 15, ${now.year}";
    } else {
      return "January 15, ${now.year + 1}";
    }
  }

  String price(String? selectedSize) {
    String price = '';
    if (selectedSize == '5x5') {
      price = 'PHP 800.00';
    } else if (selectedSize == '5x10') {
      price = 'PHP 1650.00';
    } else if (selectedSize == '10x10') {
      price = 'PHP 2200.00';
    }

    return price;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SDB LEASE DETAILS'),
      ),
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
            child: Column(
              children: [
                ValueListenableBuilder(
                    valueListenable: selectedBranch,
                    builder: (context, String branch, child) {
                      return FormAndLabel(
                        fieldAttributes: [
                          FieldAttributes(
                            labelText: 'Branch',
                            formType: 'Dropdown',
                            fieldText: branch,
                            //controller: branchController,
                            tappable: true,
                            tapped: false,
                            selected: selectedBranch,
                            dropdownArray: allBranches,
                          ),
                        ],
                      );
                    }),
                ValueListenableBuilder(
                    valueListenable: selectedSize,
                    builder: (context, String size, child) {
                      return FormAndLabel(
                        fieldAttributes: [
                          FieldAttributes(
                            labelText: 'SDB Number',
                            supplementalText: '(Automatically chosen for you)',
                            formType: 'Disabled',
                            tappable: false,
                          ),
                          FieldAttributes(
                            labelText: 'Size',
                            formType: 'Dropdown',
                            fieldText: size,
                            tappable: true,
                            tapped: false,
                            selected: selectedSize,
                            dropdownArray: sizes,
                          ),
                        ],
                      );
                    }),
                ValueListenableBuilder(
                    valueListenable: selectedSize,
                    builder: (context, String size, child) {
                      return FormAndLabel(
                        fieldAttributes: [
                          FieldAttributes(
                              labelText: 'Annual Fee',
                              formType: 'Disabled',
                              fieldText: price(selectedSize.value),
                              tappable: false),
                          FieldAttributes(
                              labelText: 'Deposit for Keys',
                              fieldText: 'PHP 1000.00',
                              formType: 'Disabled',
                              tappable: false),
                        ],
                      );
                    }),
                FormAndLabel(
                  fieldAttributes: [
                    FieldAttributes(
                        labelText: 'Date Leased',
                        supplementalText: '(Date Today)',
                        fieldText: formattedDateTime(),
                        formType: 'Disabled',
                        tappable: false),
                    FieldAttributes(
                        labelText: 'Expiry Date',
                        supplementalText: '(On The Following January 15)',
                        fieldText: nextJanuary(),
                        formType: 'Disabled',
                        tappable: false),
                  ],
                ),

                Text(
                  'We\'ll need your personal information too',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: MediaQuery.of(context).size.height * 0.02),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.007,
                ),
                //Button
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.height * 0.15,
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: ElevatedButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text('Next '),
                          Icon(Icons.arrow_circle_right)
                        ],
                      ),
                      onPressed: () {
                        if (selectedSize.value == '') {

                          return;
                        }
                        print(
                            '${selectedSize.value} and ${selectedBranch.value}');
                        Navigator.pushNamed(context, '/leasescreen2');
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
