import 'package:flutter/material.dart';
import 'formandlabel.dart';
import 'fieldattributes.dart';

class LesseeDetailsScreen extends StatefulWidget {
  const LesseeDetailsScreen({Key? key}) : super(key: key);

  @override
  State<LesseeDetailsScreen> createState() => LesseeDetailsScreenState();
}

class LesseeDetailsScreenState extends State<LesseeDetailsScreen> {
  TextEditingController fNameController1 = TextEditingController();
  TextEditingController mNameController1 = TextEditingController();
  TextEditingController lNameController1 = TextEditingController();
  TextEditingController fNameController2 = TextEditingController();
  TextEditingController mNameController2 = TextEditingController();
  TextEditingController lNameController2 = TextEditingController();
  TextEditingController houseController1 = TextEditingController();
  TextEditingController houseController2 = TextEditingController();
  TextEditingController contactController1 = TextEditingController();
  TextEditingController contactController2 = TextEditingController();
  TextEditingController debitController = TextEditingController();

  //error checkers
  ValueNotifier<String> fName1error = ValueNotifier<String>('');
  ValueNotifier<String> mName1error = ValueNotifier<String>('');
  ValueNotifier<String> lName1error = ValueNotifier<String>('');
  ValueNotifier<String> fName2error = ValueNotifier<String>('');
  ValueNotifier<String> mName2error = ValueNotifier<String>('');
  ValueNotifier<String> lName2error = ValueNotifier<String>('');
  ValueNotifier<String> province1error = ValueNotifier<String>('');
  ValueNotifier<String> city1error = ValueNotifier<String>('');
  ValueNotifier<String> barangay1error = ValueNotifier<String>('');
  ValueNotifier<String> province2error = ValueNotifier<String>('');
  ValueNotifier<String> city2error = ValueNotifier<String>('');
  ValueNotifier<String> barangay2error = ValueNotifier<String>('');
  ValueNotifier<String> house1error = ValueNotifier<String>('');
  ValueNotifier<String> house2error = ValueNotifier<String>('');
  ValueNotifier<String> contact1error = ValueNotifier<String>('');
  ValueNotifier<String> contact2error = ValueNotifier<String>('');
  ValueNotifier<String> debitError = ValueNotifier<String>('');

  //Values we need
  static ValueNotifier<String> province1 = ValueNotifier<String>('');
  static ValueNotifier<String> city1 = ValueNotifier<String>('');
  static ValueNotifier<String> barangay1 = ValueNotifier<String>('');
  static ValueNotifier<String> province2 = ValueNotifier<String>('');
  static ValueNotifier<String> city2 = ValueNotifier<String>('');
  static ValueNotifier<String> barangay2 = ValueNotifier<String>('');
  static String fName1 = '';
  static String mName1 = '';
  static String lName1 = '';
  static String fName2 = '';
  static String mName2 = '';
  static String lName2 = '';
  static String house1 = '';
  static String house2 = '';
  static String contact1 = '';
  static String contact2 = '';
  static String debit = '';
  static bool hasLessee2 = false;

  List<String> provinceList = [
    'prov 1',
    'prov 2',
    'prov 3',
    'prov 4',
    'prov 5',
    'prov 6',
  ];

  List<String> cityList = [
    'city 1',
    'city 2',
    'city 3',
    'city 4',
    'city 5',
    'city 6',
  ];

  List<String> barangayList = [
    'brgy 1',
    'brgy 2',
    'brgy 3',
    'brgy 4',
    'brgy 5',
    'brgy 6',
  ];

  @override
  void initState() {
    super.initState();
    fNameController1.addListener(() {
      fName1 = fNameController1.text;
      print('first name1: $fName1');
    });
    mNameController1.addListener(() {
      mName1 = mNameController1.text;
      print('middle name1: $mName1');
    });
    lNameController1.addListener(() {
      lName1 = lNameController1.text;
      print('last name1: $lName1');
    });
    fNameController2.addListener(() {
      fName2 = fNameController2.text;
      print('first name2: $fName2');
    });
    mNameController2.addListener(() {
      mName2 = mNameController2.text;
      print('middle name2: $mName2');
    });
    lNameController2.addListener(() {
      lName2 = lNameController2.text;
      print('last name2: $lName2');
    });
    houseController1.addListener(() {
      house1 = houseController1.text;
      print('house1: $house1');
    });
    houseController2.addListener(() {
      house2 = houseController2.text;
      print('house2: $house2');
    });
    contactController1.addListener(() {
      contact1 = contactController1.text;
      print('contact1: $contact1');
    });
    contactController2.addListener(() {
      contact2 = contactController2.text;
      print('contact2: $contact2');
    });
    debitController.addListener(() {
      debit = debitController.text;
      print('debit: $debit');
    });
  }

  @override
  void dispose() {
    super.dispose();
    fNameController1.dispose();
    mNameController1.dispose();
    lNameController1.dispose();
    fNameController2.dispose();
    mNameController2.dispose();
    lNameController2.dispose();
    houseController1.dispose();
    houseController2.dispose();
    contactController1.dispose();
    contactController2.dispose();
    debitController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('LESSEE DETAILS'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Lessee 1',
              style: Theme.of(context).textTheme.headline6?.copyWith(
                  fontSize: MediaQuery.of(context).size.height * 0.03),
            ),
            ValueListenableBuilder(
                valueListenable: fName1error,
                builder: (context, String errorFName1, child) {
                  return FormAndLabel(fieldAttributes: [
                    FieldAttributes(
                      supplementalText: 'First Name',
                      errorText: errorFName1,
                      formType: 'TextField',
                      controller: fNameController1,
                      tappable: true,
                      tapped: false,
                      tight: true,
                    ),
                  ]);
                }),
            ValueListenableBuilder(
                valueListenable: mName1error,
                builder: (context, String errorMName1, child) {
                  return FormAndLabel(fieldAttributes: [
                    FieldAttributes(
                      supplementalText: 'Middle Name',
                      errorText: errorMName1,
                      formType: 'TextField',
                      controller: mNameController1,
                      tappable: true,
                      tapped: false,
                      tight: true,
                    ),
                  ]);
                }),
            ValueListenableBuilder(
                valueListenable: lName1error,
                builder: (context, String errorLName1, child) {
                  return FormAndLabel(fieldAttributes: [
                    FieldAttributes(
                      supplementalText: 'Last Name',
                      errorText: errorLName1,
                      formType: 'TextField',
                      controller: lNameController1,
                      tappable: true,
                      tapped: false,
                    ),
                  ]);
                }),

            Text(
              'Address of Lessee 1',
              style: Theme.of(context).textTheme.headline6?.copyWith(
                  fontSize: MediaQuery.of(context).size.height * 0.03),
            ),
            ValueListenableBuilder(
                valueListenable: province1error,
                builder: (context, String errorProvince1, child) {
                  return ValueListenableBuilder(
                      valueListenable: city1error,
                      builder: (context, String errorCity1, child) {
                        return ValueListenableBuilder(
                            valueListenable: province1,
                            builder: (context, String prov1, child) {
                              return ValueListenableBuilder(
                                  valueListenable: city1,
                                  builder: (context, String ct1, child) {
                                    return FormAndLabel(fieldAttributes: [
                                      FieldAttributes(
                                        supplementalText: 'Province',
                                        errorText: errorProvince1,
                                        fieldText: prov1,
                                        formType: 'Dropdown',
                                        tappable: true,
                                        tapped: false,
                                        selected: province1,
                                        dropdownArray: provinceList,
                                        tight: true,
                                      ),
                                      FieldAttributes(
                                        supplementalText: 'City/Municipality',
                                        errorText: errorCity1,
                                        fieldText: ct1,
                                        formType: 'Dropdown',
                                        tappable: true,
                                        tapped: false,
                                        selected: city1,
                                        dropdownArray: cityList,
                                        tight: true,
                                      ),
                                    ]);
                                  });
                            });
                      });
                }),
            ValueListenableBuilder(
                valueListenable: barangay1error,
                builder: (context, String errorBarangay1, child) {
                  return ValueListenableBuilder(
                      valueListenable: barangay1,
                      builder: (context, String bgy1, child) {
                        return FormAndLabel(fieldAttributes: [
                          FieldAttributes(
                            supplementalText: 'Barangay',
                            fieldText: bgy1,
                            errorText: errorBarangay1,
                            formType: 'Dropdown',
                            tappable: true,
                            tapped: false,
                            selected: barangay1,
                            dropdownArray: barangayList,
                            tight: true,
                          ),
                          FieldAttributes(
                            supplementalText: 'Zip Code',
                            formType: 'Disabled',
                            fieldText: 'wala muna',
                            tappable: false,
                            tight: true,
                          ),
                        ]);
                      });
                }),
            ValueListenableBuilder(
                valueListenable: house1error,
                builder: (context, String errorHouse1, child) {
                  return FormAndLabel(fieldAttributes: [
                    FieldAttributes(
                      supplementalText: 'Bldg No./House No./Street',
                      errorText: errorHouse1,
                      formType: 'TextField',
                      controller: houseController1,
                      tappable: true,
                      tapped: false,
                    ),
                  ]);
                }),
            ValueListenableBuilder(
                valueListenable: contact1error,
                builder: (context, String errorContact1, child) {
                  return FormAndLabel(fieldAttributes: [
                    FieldAttributes(
                      labelText: 'Lessee 1 Contact Number',
                      supplementalText: '(+639XXXXXXXX)',
                      errorText: errorContact1,
                      formType: 'TextField',
                      controller: contactController1,
                      tappable: true,
                      tapped: false,
                      tight: true,
                    ),
                  ]);
                }),
            Row(
              children: [
                Transform.scale(
                  scale: 1.5,
                  child: Checkbox(
                    value: hasLessee2,
                    onChanged: (value) {
                      setState(() {
                        hasLessee2 = value as bool;
                      });

                      //reset error texts, values, and textfields
                      fName2error.value = '';
                      mName2error.value = '';
                      lName2error.value = '';
                      province2error.value = '';
                      city2error.value = '';
                      barangay2error.value = '';
                      house2error.value = '';
                      contact2error.value = '';

                      fName2 = '';
                      mName2 = '';
                      lName2 = '';
                      province2.value = '';
                      city2.value = '';
                      barangay2.value = '';
                      house2 = '';
                      contact2 = '';

                      fNameController2.clear();
                      mNameController2.clear();
                      lNameController2.clear();
                      houseController2.clear();
                      contactController2.clear();
                    },
                  ),
                ),
                Text(
                  'Add Lessee 2',
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                      fontSize: MediaQuery.of(context).size.height * 0.02),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Visibility(
                visible: hasLessee2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lessee 2',
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                          fontSize: MediaQuery.of(context).size.height * 0.03),
                    ),
                    ValueListenableBuilder(
                        valueListenable: fName2error,
                        builder: (context, String errorFName2, child) {
                          return FormAndLabel(fieldAttributes: [
                            FieldAttributes(
                              supplementalText: 'First Name',
                              errorText: errorFName2,
                              formType: 'TextField',
                              controller: fNameController2,
                              tappable: true,
                              tapped: false,
                              tight: true,
                            ),
                          ]);
                        }),
                    ValueListenableBuilder(
                        valueListenable: mName2error,
                        builder: (context, String errorMName2, child) {
                          return FormAndLabel(fieldAttributes: [
                            FieldAttributes(
                              supplementalText: 'Middle Name',
                              errorText: errorMName2,
                              formType: 'TextField',
                              controller: mNameController2,
                              tappable: true,
                              tapped: false,
                              tight: true,
                            ),
                          ]);
                        }),
                    ValueListenableBuilder(
                        valueListenable: lName2error,
                        builder: (context, String errorLName2, child) {
                          return FormAndLabel(fieldAttributes: [
                            FieldAttributes(
                              supplementalText: 'Last Name',
                              errorText: errorLName2,
                              formType: 'TextField',
                              controller: lNameController2,
                              tappable: true,
                              tapped: false,
                            ),
                          ]);
                        }),
                    Text(
                      'Address of Lessee 2',
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                          fontSize: MediaQuery.of(context).size.height * 0.03),
                    ),
                    ValueListenableBuilder(
                        valueListenable: province2error,
                        builder: (context, String errorProvince2, child) {
                          return ValueListenableBuilder(
                              valueListenable: city2error,
                              builder: (context, String errorCity2, child) {
                                return ValueListenableBuilder(
                                    valueListenable: province2,
                                    builder: (context, String prov2, child) {
                                      return ValueListenableBuilder(
                                          valueListenable: city2,
                                          builder:
                                              (context, String ct2, child) {
                                            return FormAndLabel(
                                                fieldAttributes: [
                                                  FieldAttributes(
                                                    supplementalText:
                                                        'Province',
                                                    errorText: errorProvince2,
                                                    formType: 'Dropdown',
                                                    fieldText: prov2,
                                                    tappable: true,
                                                    tapped: false,
                                                    selected: province2,
                                                    dropdownArray: provinceList,
                                                    tight: true,
                                                  ),
                                                  FieldAttributes(
                                                    supplementalText:
                                                        'City/Municipality',
                                                    errorText: errorCity2,
                                                    formType: 'Dropdown',
                                                    fieldText: ct2,
                                                    tappable: true,
                                                    tapped: false,
                                                    selected: city2,
                                                    dropdownArray: cityList,
                                                    tight: true,
                                                  ),
                                                ]);
                                          });
                                    });
                              });
                        }),
                    ValueListenableBuilder(
                        valueListenable: barangay2error,
                        builder: (context, String errorBarangay2, child) {
                          return ValueListenableBuilder(
                              valueListenable: barangay2,
                              builder: (context, String bgy2, child) {
                                return FormAndLabel(fieldAttributes: [
                                  FieldAttributes(
                                    supplementalText: 'Barangay',
                                    errorText: errorBarangay2,
                                    formType: 'Dropdown',
                                    fieldText: bgy2,
                                    tappable: true,
                                    tapped: false,
                                    selected: barangay2,
                                    dropdownArray: barangayList,
                                    tight: true,
                                  ),
                                  FieldAttributes(
                                    supplementalText: 'Zip Code',
                                    formType: 'Disabled',
                                    fieldText: 'wala muna',
                                    tappable: false,
                                    tight: true,
                                  ),
                                ]);
                              });
                        }),
                    ValueListenableBuilder(
                        valueListenable: house2error,
                        builder: (context, String errorHouse2, child) {
                          return FormAndLabel(fieldAttributes: [
                            FieldAttributes(
                              supplementalText: 'Bldg No./House No./Street',
                              errorText: errorHouse2,
                              formType: 'TextField',
                              controller: houseController2,
                              tappable: true,
                              tapped: false,
                            ),
                          ]);
                        }),
                    ValueListenableBuilder(
                        valueListenable: contact2error,
                        builder: (context, String errorContact2, child) {
                          return FormAndLabel(fieldAttributes: [
                            FieldAttributes(
                              labelText: 'Lessee 2 Contact Number',
                              errorText: errorContact2,
                              supplementalText: '(+639XXXXXXXX)',
                              formType: 'TextField',
                              controller: contactController2,
                              tappable: true,
                              tapped: false,
                            ),
                          ]);
                        }),
                  ],
                )),

            ValueListenableBuilder(
                valueListenable: debitError,
                builder: (context, String errorDebit, child) {
                  return FormAndLabel(fieldAttributes: [
                    FieldAttributes(
                      labelText:
                          'For renewal of charges, please debit CA/SA No.',
                      errorText: errorDebit,
                      formType: 'TextField',
                      controller: debitController,
                      tappable: true,
                      tapped: false,
                    )
                  ]);
                }),
            //Button
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.height * 0.15,
                height: MediaQuery.of(context).size.height * 0.05,
                child: ElevatedButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Next'),
                      Icon(Icons.arrow_circle_right, size: MediaQuery.of(context).size.height * 0.02,),
                    ],
                  ),
                  onPressed: () {
                    List<String> fields = [
                      fName1,
                      mName1,
                      lName1,
                      province1.value,
                      city1.value,
                      barangay1.value,
                      house1,
                      contact1,
                    ];
                    List<ValueNotifier> errors = [
                      fName1error,
                      mName1error,
                      lName1error,
                      province1error,
                      city1error,
                      barangay1error,
                      house1error,
                      contact1error,
                    ];
                    if (hasLessee2) {
                      fields = List.from(fields)
                        ..addAll([
                          fName2,
                          mName2,
                          lName2,
                          province2.value,
                          city2.value,
                          barangay2.value,
                          house2,
                          contact2,
                        ]);
                      errors = List.from(errors)
                        ..addAll([
                          fName2error,
                          mName2error,
                          lName2error,
                          province2error,
                          city2error,
                          barangay2error,
                          house2error,
                          contact2error,
                        ]);
                    }
                    fields.add(debit);
                    errors.add(debitError);

                    bool hasError = false;

                    for (int i = 0; i < fields.length; i++) {
                      if (fields[i] == '') {
                        errors[i].value = 'Please fill out this field properly';
                        hasError = true;
                      } else {
                        bool regexNoError = true;
                        //check if the field is a name field, then perform regex matching
                        if ((i >= 0 && i <= 2) || (i >= 8 && i <= 10)) {
                          regexNoError = RegExp(
                                  r'^[^0-9_!¡?÷?¿/\\+=@#$%ˆ&*(){}|~<>;:[\]]*$')
                              .hasMatch(fields[i]);
                        } else if (i == 7 || i == 15) {
                          regexNoError =
                              RegExp(r'^(\+639)[0-9]{9}').hasMatch(fields[i]);
                        }
                        if (!regexNoError) {
                          errors[i].value =
                              'Please fill out this field properly';
                        } else {
                          errors[i].value = '';
                        }
                      }
                    }

                    print('may error ba $hasError $debit');
                    if (!hasError) {
                      Navigator.pushNamed(context, '/leasescreen3');
                    }
                  },
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
