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
  ValueNotifier<String> province1 = ValueNotifier<String>('');
  ValueNotifier<String> city1 = ValueNotifier<String>('');
  ValueNotifier<String> barangay1 = ValueNotifier<String>('');
  ValueNotifier<String> province2 = ValueNotifier<String>('');
  ValueNotifier<String> city2 = ValueNotifier<String>('');
  ValueNotifier<String> barangay2 = ValueNotifier<String>('');
  String fName1 = '';
  String mName1 = '';
  String lName1 = '';
  String fName2 = '';
  String mName2 = '';
  String lName2 = '';
  String house1 = '';
  String house2 = '';
  String contact1 = '';
  String contact2 = '';
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
      print(fName1);
    });
    mNameController1.addListener(() {
      mName1 = mNameController1.text;
      print(mName1);
    });
    lNameController1.addListener(() {
      lName1 = lNameController1.text;
      print(lName1);
    });
    fNameController2.addListener(() {
      fName2 = fNameController2.text;
      print(fName2);
    });
    mNameController2.addListener(() {
      mName2 = mNameController2.text;
      print(mName2);
    });
    lNameController2.addListener(() {
      lName2 = lNameController2.text;
      print(lName2);
    });
    houseController1.addListener(() {
      house1 = houseController1.text;
      print(house1);
    });
    houseController2.addListener(() {
      house2 = houseController2.text;
      print(house2);
    });
    contactController1.addListener(() {
      contact1 = contactController1.text;
      print(contact1);
    });
    contactController2.addListener(() {
      contact2 = contactController2.text;
      print(contact2);
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('LESSEE DETAILS'),
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
            FormAndLabel(fieldAttributes: [
              FieldAttributes(
                supplementalText: 'First Name',
                formType: 'TextField',
                controller: fNameController1,
                tappable: true,
                tapped: false,
                tight: true,
              ),
            ]),
            FormAndLabel(fieldAttributes: [
              FieldAttributes(
                supplementalText: 'Middle Name',
                formType: 'TextField',
                controller: mNameController1,
                tappable: true,
                tapped: false,
                tight: true,
              ),
            ]),
            FormAndLabel(fieldAttributes: [
              FieldAttributes(
                supplementalText: 'Last Name',
                formType: 'TextField',
                controller: lNameController1,
                tappable: true,
                tapped: false,
              ),
            ]),
            Text(
              'Address of Lessee 1',
              style: Theme.of(context).textTheme.headline6?.copyWith(
                  fontSize: MediaQuery.of(context).size.height * 0.03),
            ),
            ValueListenableBuilder(
                valueListenable: province1,
                builder: (context, String prov1, child) {
                  return ValueListenableBuilder(
                      valueListenable: city1,
                      builder: (context, String ct1, child) {
                        return FormAndLabel(fieldAttributes: [
                          FieldAttributes(
                            supplementalText: 'Province',
                            formType: 'Dropdown',
                            fieldText: prov1,
                            tappable: true,
                            tapped: false,
                            selected: province1,
                            dropdownArray: provinceList,
                            tight: true,
                          ),
                          FieldAttributes(
                            supplementalText: 'City/Municipality',
                            formType: 'Dropdown',
                            fieldText: ct1,
                            tappable: true,
                            tapped: false,
                            selected: city1,
                            dropdownArray: cityList,
                            tight: true,
                          ),
                        ]);
                      });
                }),
            ValueListenableBuilder(
                valueListenable: barangay1,
                builder: (context, String bgy1, child) {
                  return FormAndLabel(fieldAttributes: [
                    FieldAttributes(
                      supplementalText: 'Barangay',
                      formType: 'Dropdown',
                      fieldText: bgy1,
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
                }),
            FormAndLabel(fieldAttributes: [
              FieldAttributes(
                supplementalText: 'Bldg No./House No./Street',
                formType: 'TextField',
                controller: houseController1,
                tappable: true,
                tapped: false,
              ),
            ]),
            FormAndLabel(fieldAttributes: [
              FieldAttributes(
                labelText: 'Lessee 1 Contact Number',
                supplementalText: '(+639XXXXXXXX)',
                formType: 'TextField',
                controller: contactController1,
                tappable: true,
                tapped: false,
                tight: true,
              ),
            ]),
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
                    FormAndLabel(fieldAttributes: [
                      FieldAttributes(
                        supplementalText: 'First Name',
                        formType: 'TextField',
                        controller: fNameController2,
                        tappable: true,
                        tapped: false,
                        tight: true,
                      ),
                    ]),
                    FormAndLabel(fieldAttributes: [
                      FieldAttributes(
                        supplementalText: 'Middle Name',
                        formType: 'TextField',
                        controller: mNameController2,
                        tappable: true,
                        tapped: false,
                        tight: true,
                      ),
                    ]),
                    FormAndLabel(fieldAttributes: [
                      FieldAttributes(
                        supplementalText: 'Last Name',
                        formType: 'TextField',
                        controller: lNameController2,
                        tappable: true,
                        tapped: false,
                      ),
                    ]),
                    Text(
                      'Address of Lessee 2',
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                          fontSize: MediaQuery.of(context).size.height * 0.03),
                    ),
                    ValueListenableBuilder(
                        valueListenable: province2,
                        builder: (context, String prov2, child) {
                          return ValueListenableBuilder(
                              valueListenable: city2,
                              builder: (context, String ct2, child) {
                                return FormAndLabel(fieldAttributes: [
                                  FieldAttributes(
                                    supplementalText: 'Province',
                                    formType: 'Dropdown',
                                    fieldText: prov2,
                                    tappable: true,
                                    tapped: false,
                                    selected: province2,
                                    dropdownArray: provinceList,
                                    tight: true,
                                  ),
                                  FieldAttributes(
                                    supplementalText: 'City/Municipality',
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
                        }),
                    ValueListenableBuilder(
                        valueListenable: barangay2,
                        builder: (context, String bgy2, child) {
                          return FormAndLabel(fieldAttributes: [
                            FieldAttributes(
                              supplementalText: 'Barangay',
                              formType: 'Dropdown',
                              fieldText: bgy2,
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
                        }),
                    FormAndLabel(fieldAttributes: [
                      FieldAttributes(
                        supplementalText: 'Bldg No./House No./Street',
                        formType: 'TextField',
                        controller: houseController2,
                        tappable: true,
                        tapped: false,
                      ),
                    ]),
                    FormAndLabel(fieldAttributes: [
                      FieldAttributes(
                        labelText: 'Lessee 2 Contact Number',
                        supplementalText: '(+639XXXXXXXX)',
                        formType: 'TextField',
                        controller: contactController2,
                        tappable: true,
                        tapped: false,
                      ),
                    ]),
                  ],
                )),
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
                    Navigator.pushNamed(context, '/leasescreen3');
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
