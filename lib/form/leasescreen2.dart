import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'fieldandlabel.dart';
import 'dart:convert';

class LesseeDetailsScreen extends StatefulWidget {
  const LesseeDetailsScreen({Key? key}) : super(key: key);

  @override
  State<LesseeDetailsScreen> createState() => LesseeDetailsScreenState();
}

class LesseeDetailsScreenState extends State<LesseeDetailsScreen> {
  static Size screenSize = WidgetsBinding.instance.window.physicalSize;
  double screenWidth = screenSize.width;
  double screenHeight = screenSize.height;

  static String fName1 = '';
  static String mName1 = '';
  static String lName1 = '';
  static String fName2 = '';
  static String mName2 = '';
  static String lName2 = '';

  static String region1 = '';
  static String province1 = '';
  static String city1 = '';
  static String barangay1 = '';
  static String house1 = '';
  static String zipcode1 = '';
  static String region2 = '';
  static String province2 = '';
  static String city2 = '';
  static String barangay2 = '';
  static String house2 = '';
  static String zipcode2 = '';

  static String contact1 = '';
  static String contact2 = '';

  static String debit = '';

  static bool hasLessee2 = true;

  List allAddresses = [];
  List allRegions = [
    'ARMM',
    'CAR',
    'NCR',
    'I',
    'II',
    'III',
    'IV',
    'V',
    'VI',
    'VII',
    'VIII',
    'IX',
    'X',
    'XI',
    'XII',
    'XIII'
  ];
  List visibleProvinces1 = [];
  List visibleProvinces2 = [];
  List visibleCities1 = [];
  List visibleCities2 = [];
  List visibleBarangays1 = [];
  List visibleBarangays2 = [];

  bool firstBuild = true;

  bool region1DropdownOpened = false;
  bool province1DropdownOpened = false;
  bool city1DropdownOpened = false;
  bool barangay1DropdownOpened = false;
  bool region2DropdownOpened = false;
  bool province2DropdownOpened = false;
  bool city2DropdownOpened = false;
  bool barangay2DropdownOpened = false;

  String? fName1Error;
  String? mName1Error;
  String? lName1Error;
  String? fName2Error;
  String? mName2Error;
  String? lName2Error;
  String? region1Error;
  String? province1Error;
  String? city1Error;
  String? barangay1Error;
  String? zipcode1Error;
  String? region2Error;
  String? province2Error;
  String? city2Error;
  String? barangay2Error;
  String? zipcode2Error;
  String? contact1Error;
  String? contact2Error;
  String? house1Error;
  String? house2Error;
  String? debitError;

  TextEditingController fName1Controller = TextEditingController();
  TextEditingController mName1Controller = TextEditingController();
  TextEditingController lName1Controller = TextEditingController();
  TextEditingController fName2Controller = TextEditingController();
  TextEditingController mName2Controller = TextEditingController();
  TextEditingController lName2Controller = TextEditingController();
  TextEditingController house1Controller = TextEditingController();
  TextEditingController house2Controller = TextEditingController();
  TextEditingController contact1Controller = TextEditingController();
  TextEditingController contact2Controller = TextEditingController();
  TextEditingController debitController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fName1Controller.addListener(() {
      setState(() {
        fName1 = fName1Controller.text;
      });
    });
    mName1Controller.addListener(() {
      setState(() {
        mName1 = mName1Controller.text;
      });
    });
    lName1Controller.addListener(() {
      setState(() {
        lName1 = lName1Controller.text;
      });
    });
    fName2Controller.addListener(() {
      setState(() {
        fName2 = fName2Controller.text;
      });
    });
    mName2Controller.addListener(() {
      setState(() {
        mName2 = mName2Controller.text;
      });
    });
    lName2Controller.addListener(() {
      setState(() {
        lName2 = lName2Controller.text;
      });
    });
    contact1Controller.addListener(() {
      setState(() {
        contact1 = contact1Controller.text;
      });
    });
    contact2Controller.addListener(() {
      setState(() {
        contact2 = contact2Controller.text;
      });
    });
    house1Controller.addListener(() {
      setState(() {
        house1 = house1Controller.text;
      });
    });
    house2Controller.addListener(() {
      setState(() {
        house2 = house2Controller.text;
      });
    });
    debitController.addListener(() {
      setState(() {
        debit = debitController.text;
        print('boy $debit');
      });
    });
  }

  @override
  void dispose() {
    fName1Controller.dispose();
    mName1Controller.dispose();
    lName1Controller.dispose();
    fName2Controller.dispose();
    mName2Controller.dispose();
    lName2Controller.dispose();
    contact1Controller.dispose();
    contact2Controller.dispose();
    house1Controller.dispose();
    house2Controller.dispose();
    debitController.dispose();
    super.dispose();
  }

  updateSelected(String valueToChange, String newValue) {
    setState(() {
      if (valueToChange == 'region1') {
        if (region1 != newValue) {
          province1 = '';
          city1 = '';
          barangay1 = '';
          zipcode1 = '';

          region1 = newValue;
          final visibleProvinces1Unparsed =
              allAddresses.where((x) => x['Region'] == newValue).toList();

          visibleProvinces1 = visibleProvinces1Unparsed
              .map((x) => x['Province'])
              .toSet()
              .toList();
        }
      } else if (valueToChange == 'province1') {
        if (province1 != newValue) {
          city1 = '';
          barangay1 = '';
          zipcode1 = '';

          province1 = newValue;
          final visibleCities1Unparsed = allAddresses
              .where(
                  (x) => (x['Region'] == region1 && x['Province'] == newValue))
              .toList();

          visibleCities1 = visibleCities1Unparsed
              .map((x) => x['City/Municipality'])
              .toSet()
              .toList();
        }
      } else if (valueToChange == 'city1') {
        if (city1 != newValue) {
          barangay1 = '';
          zipcode1 = '';

          city1 = newValue;
          final visibleBarangays1Unparsed = allAddresses
              .where((x) => (x['Region'] == region1 &&
                  x['Province'] == province1 &&
                  x['City/Municipality'] == newValue))
              .toList();

          visibleBarangays1 = visibleBarangays1Unparsed
              .map((x) => x['Barangay'])
              .toSet()
              .toList();

          visibleBarangays1.sort();
        }
      } else if (valueToChange == 'barangay1') {
        if (barangay1 != newValue) {
          barangay1 = newValue;

          final zipcodeUnparsed = allAddresses
              .where((x) =>
                  x['Region'] == region1 &&
                  x['Province'] == province1 &&
                  x['City/Municipality'] == city1 &&
                  x['Barangay'] == newValue)
              .toList();

          zipcode1 = zipcodeUnparsed[0]['Zip Code'];
        }
      } else if (valueToChange == 'region2') {
        if (region2 != newValue) {
          province2 = '';
          city2 = '';
          barangay2 = '';
          zipcode2 = '';

          region2 = newValue;
          final visibleProvinces2Unparsed =
              allAddresses.where((x) => x['Region'] == newValue).toList();

          visibleProvinces2 = visibleProvinces2Unparsed
              .map((x) => x['Province'])
              .toSet()
              .toList();
        }
      } else if (valueToChange == 'province2') {
        if (province2 != newValue) {
          city2 = '';
          barangay2 = '';
          zipcode2 = '';

          province2 = newValue;
          final visibleCities2Unparsed = allAddresses
              .where(
                  (x) => (x['Region'] == region2 && x['Province'] == newValue))
              .toList();

          visibleCities2 = visibleCities2Unparsed
              .map((x) => x['City/Municipality'])
              .toSet()
              .toList();
        }
      } else if (valueToChange == 'city2') {
        if (city2 != newValue) {
          barangay2 = '';
          zipcode2 = '';

          city2 = newValue;
          final visibleBarangays2Unparsed = allAddresses
              .where((x) => (x['Region'] == region2 &&
                  x['Province'] == province2 &&
                  x['City/Municipality'] == newValue))
              .toList();

          visibleBarangays2 = visibleBarangays2Unparsed
              .map((x) => x['Barangay'])
              .toSet()
              .toList();

          visibleBarangays2.sort();
        }
      } else if (valueToChange == 'barangay2') {
        if (barangay2 != newValue) {
          barangay2 = newValue;

          final zipcodeUnparsed = allAddresses
              .where((x) =>
                  x['Region'] == region2 &&
                  x['Province'] == province2 &&
                  x['City/Municipality'] == city2 &&
                  x['Barangay'] == newValue)
              .toList();

          zipcode2 = zipcodeUnparsed[0]['Zip Code'];
        }
      }
    });
  }

  toggleVisibility(String valueToChange, String pressedFrom) {
    setState(() {
      if (valueToChange == 'region1') {
        region1DropdownOpened = !region1DropdownOpened;
      } else if (valueToChange == 'region2') {
        region2DropdownOpened = !region2DropdownOpened;
      } else if (valueToChange == 'province1') {
        province1DropdownOpened = !province1DropdownOpened;
      } else if (valueToChange == 'province2') {
        province2DropdownOpened = !province2DropdownOpened;
      } else if (valueToChange == 'city1') {
        city1DropdownOpened = !city1DropdownOpened;
      } else if (valueToChange == 'city2') {
        city2DropdownOpened = !city2DropdownOpened;
      } else if (valueToChange == 'barangay1') {
        barangay1DropdownOpened = !barangay1DropdownOpened;
      } else if (valueToChange == 'barangay2') {
        barangay2DropdownOpened = !barangay2DropdownOpened;
      }
    });
  }

  bool formValidation() {
    bool clearToGo = true;
    setState(() {
      //fName1
      if (!RegExp(r'^[^0-9_!¡÷?¿/\\+=@#$%ˆ&*(){}|~<>;:[\]]*$')
              .hasMatch(fName1) ||
          fName1 == '') {
        fName1Error =
            'Please enter a name without numbers or special characters';
        clearToGo = false;
      } else {
        fName1Error = null;
      }

      //mName1
      if (!RegExp(r'^[^0-9_!¡÷?¿/\\+=@#$%ˆ&*(){}|~<>;:[\]]*$')
          .hasMatch(mName1)) {
        mName1Error =
            'Please enter a name without numbers or special characters';
        clearToGo = false;
      } else {
        mName1Error = null;
      }

      //lName1
      if (!RegExp(r'^[^0-9_!¡÷?¿/\\+=@#$%ˆ&*(){}|~<>;:[\]]*$')
              .hasMatch(lName1) ||
          lName1 == '') {
        lName1Error =
            'Please enter a name without numbers or special characters';
        clearToGo = false;
      } else {
        lName1Error = null;
      }

      if (region1 == '' && province1 == '') {
        region1Error = 'Please enter a region';
        province1Error = 'Please enter a province';
        clearToGo = false;
      } else if (region1 == '' && province1 != '') {
        region1Error = 'Please enter a region';
        province1Error = '';
        clearToGo = false;
      } else if (region1 != '' && province1 == '') {
        region1Error = '';
        province1Error = 'Please enter a province';
        clearToGo = false;
      } else {
        region1Error = null;
        province1Error = null;
      }

      if (city1 == '' && barangay1 == '') {
        city1Error = 'Please enter a city';
        barangay1Error = 'Please enter a barangay';
        clearToGo = false;
      } else if (city1 == '' && barangay1 != '') {
        city1Error = 'Please enter a city';
        barangay1Error = '';
        clearToGo = false;
      } else if (city1 != '' && barangay1 == '') {
        city1Error = '';
        barangay1Error = 'Please enter a barangay';
        clearToGo = false;
      } else {
        city1Error = null;
        barangay1Error = null;
      }

      //house
      if (house1 == '') {
        house1Error = 'Please enter Bldg No./House No./Street';
        zipcode1Error = '';
        clearToGo = false;
      } else {
        house1Error = null;
        zipcode1Error = null;
      }

      //contact no
      if (!RegExp(r'^\+639[0-9]{9}$').hasMatch(contact1)) {
        contact1Error = 'Please enter a valid phone number';
        clearToGo = false;
      } else {
        contact1Error = null;
      }

      if (debit == '') {
        debitError = 'Please enter a valid AUB Checkings/Savings account';
        clearToGo = false;
      } else {
        debitError = null;
      }

      if (hasLessee2) {
        //fName2
        if (!RegExp(r'^[^0-9_!¡÷?¿/\\+=@#$%ˆ&*(){}|~<>;:[\]]*$')
                .hasMatch(fName2) ||
            fName2 == '') {
          fName2Error =
              'Please enter a name without numbers or special characters';
          clearToGo = false;
        } else {
          fName2Error = null;
        }

        //mName2
        if (!RegExp(r'^[^0-9_!¡÷?¿/\\+=@#$%ˆ&*(){}|~<>;:[\]]*$')
            .hasMatch(mName2)) {
          mName2Error =
              'Please enter a name without numbers or special characters';
          clearToGo = false;
        } else {
          mName2Error = null;
        }

        //lName2
        if (!RegExp(r'^[^0-9_!¡÷?¿/\\+=@#$%ˆ&*(){}|~<>;:[\]]*$')
                .hasMatch(lName2) ||
            lName2 == '') {
          lName2Error =
              'Please enter a name without numbers or special characters';
          clearToGo = false;
        } else {
          lName2Error = null;
        }

        if (region2 == '' && province2 == '') {
          region2Error = 'Please enter a region';
          province2Error = 'Please enter a province';
          clearToGo = false;
        } else if (region2 == '' && province2 != '') {
          region2Error = 'Please enter a region';
          province2Error = '';
          clearToGo = false;
        } else if (region2 != '' && province2 == '') {
          region2Error = '';
          province2Error = 'Please enter a province';
          clearToGo = false;
        } else {
          region2Error = null;
          province2Error = null;
        }
        if (city2 == '' && barangay2 == '') {
          city2Error = 'Please enter a city';
          barangay2Error = 'Please enter a barangay';
          clearToGo = false;
        } else if (city2 == '' && barangay2 != '') {
          city2Error = 'Please enter a city';
          barangay2Error = '';
          clearToGo = false;
        } else if (city2 != '' && barangay2 == '') {
          city2Error = '';
          barangay2Error = 'Please enter a barangay';
          clearToGo = false;
        } else {
          city2Error = null;
          barangay2Error = null;
        }

        //house
        if (house2 == '') {
          house2Error = 'Please enter Bldg No./House No./Street';
          zipcode2Error = '';
          clearToGo = false;
        } else {
          house2Error = null;
          zipcode2Error = null;
        }

        if (!RegExp(r'^\+639[0-9]{9}$').hasMatch(contact2)) {
          contact2Error = 'Please enter a valid phone number';
          clearToGo = false;
        } else {
          contact2Error = null;
        }
      }
    });

    return clearToGo;
  }

  Future<void> readJson() async {
    final String addressResponse =
        await rootBundle.loadString('assets/json/addresses.json');
    allAddresses = (await json.decode(addressResponse))['addresses'];

    setState(() {
      fName1Controller.clear();
      mName1Controller.clear();
      lName1Controller.clear();
      fName2Controller.clear();
      mName2Controller.clear();
      lName2Controller.clear();
      contact1Controller.clear();
      contact2Controller.clear();
      house1Controller.clear();
      house2Controller.clear();

      region1 = '';
      province1 = '';
      city1 = '';
      barangay1 = '';
      zipcode1 = '';
      house1 = '';
      region2 = '';
      province2 = '';
      city2 = '';
      barangay2 = '';
      zipcode2 = '';
      house2 = '';
    });

    firstBuild = false;
  }

  @override
  Widget build(BuildContext context) {
    if (firstBuild) {
      readJson();
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('SDB LESSEE DETAILS'),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.03),
            child: Column(
              children: [
                FieldAndLabel(
                    parent: this,
                    fieldType: 'TextField',
                    title: 'Lessee 1',
                    subtitle: 'First Name',
                    errorText: fName1Error,
                    hintText: '',
                    textController: fName1Controller,
                    valueToChange: 'fName1'),
                FieldAndLabel(
                    parent: this,
                    fieldType: 'TextField',
                    subtitle: 'Middle Name',
                    errorText: mName1Error,
                    hintText: '',
                    textController: mName1Controller,
                    valueToChange: 'mName1'),
                FieldAndLabel(
                    parent: this,
                    fieldType: 'TextField',
                    subtitle: 'Last Name',
                    errorText: lName1Error,
                    hintText: '',
                    textController: lName1Controller,
                    valueToChange: 'lName1'),
                Container(
                  alignment: Alignment.bottomLeft,
                  height: screenHeight * 0.02,
                  child: Text(
                    'Lessee 1 Address',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(fontSize: screenHeight * 0.0085),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: FieldAndLabel(
                          parent: this,
                          fieldType: 'Dropdown',
                          subtitle: 'Region',
                          errorText: region1Error,
                          fieldText: region1,
                          opened: region1DropdownOpened,
                          dropdownList: allRegions,
                          valueToChange: 'region1'),
                    ),
                    SizedBox(
                      width: screenWidth * 0.03,
                    ),
                    Expanded(
                      child: FieldAndLabel(
                          parent: this,
                          fieldType: (region1 != '') ? 'Dropdown' : 'Disabled',
                          subtitle: 'Province',
                          errorText: province1Error,
                          fieldText: province1,
                          opened: province1DropdownOpened,
                          dropdownList: visibleProvinces1,
                          valueToChange: 'province1'),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: FieldAndLabel(
                          parent: this,
                          fieldType:
                              (province1 != '') ? 'Dropdown' : 'Disabled',
                          subtitle: 'City/Municipality',
                          errorText: city1Error,
                          fieldText: city1,
                          opened: city1DropdownOpened,
                          dropdownList: visibleCities1,
                          valueToChange: 'city1'),
                    ),
                    SizedBox(
                      width: screenWidth * 0.03,
                    ),
                    Expanded(
                      child: FieldAndLabel(
                          parent: this,
                          fieldType: (city1 != '') ? 'Dropdown' : 'Disabled',
                          subtitle: 'Barangay',
                          errorText: barangay1Error,
                          fieldText: barangay1,
                          opened: barangay1DropdownOpened,
                          dropdownList: visibleBarangays1,
                          valueToChange: 'barangay1'),
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: FieldAndLabel(
                          parent: this,
                          fieldType: 'TextField',
                          subtitle: 'Bldg No./House No./Street',
                          errorText: house1Error,
                          hintText: '',
                          textController: house1Controller),
                    ),
                    SizedBox(
                      width: screenWidth * 0.03,
                    ),
                    Expanded(
                      child: FieldAndLabel(
                        parent: this,
                        fieldType: 'Disabled',
                        subtitle: 'Zip Code',
                        errorText: zipcode1Error,
                        fieldText: zipcode1,
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  height: screenHeight * 0.02,
                  child: Text(
                    'Lessee 1 Contact Number',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(fontSize: screenHeight * 0.0085),
                  ),
                ),
                FieldAndLabel(
                    parent: this,
                    fieldType: 'TextField',
                    subtitle: '(+639XXXXXXXXX)',
                    errorText: contact1Error,
                    hintText: '',
                    textController: contact1Controller),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                CheckboxListTile(
                  title: Text(
                    'Add Lessee 2',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(fontSize: screenHeight * 0.01),
                  ),
                  value: hasLessee2,
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (bool? value) {
                    setState(() {
                      hasLessee2 = !hasLessee2;

                      fName2Controller.clear();
                      mName2Controller.clear();
                      lName2Controller.clear();
                      fName2Error = null;
                      mName2Error = null;
                      lName2Error = null;
                      fName2 = '';
                      mName2 = '';
                      lName2 = '';

                      region2Error = null;
                      province2Error = null;
                      city2Error = null;
                      barangay2Error = null;
                      region2 = '';
                      province2 = '';
                      city2 = '';
                      barangay2 = '';

                      contact2Controller.clear();
                      contact2Error = null;
                      contact2 = '';

                      house2Controller.clear();
                      house2Error = null;
                      house2 = '';

                      zipcode1Error = null;
                      zipcode2 = '';
                    });
                  },
                ),
                Visibility(
                    visible: hasLessee2,
                    child: Column(
                      children: [
                        SizedBox(
                          height: screenHeight * 0.01,
                        ),
                        FieldAndLabel(
                            parent: this,
                            fieldType: 'TextField',
                            title: 'Lessee 2',
                            subtitle: 'First Name',
                            errorText: fName2Error,
                            hintText: '',
                            textController: fName2Controller,
                            valueToChange: 'fName2'),
                        FieldAndLabel(
                            parent: this,
                            fieldType: 'TextField',
                            subtitle: 'Middle Name',
                            errorText: mName2Error,
                            hintText: '',
                            textController: mName2Controller,
                            valueToChange: 'mName2'),
                        FieldAndLabel(
                            parent: this,
                            fieldType: 'TextField',
                            subtitle: 'Last Name',
                            errorText: lName2Error,
                            hintText: '',
                            textController: lName2Controller,
                            valueToChange: 'lName2'),
                        Container(
                          alignment: Alignment.bottomLeft,
                          height: screenHeight * 0.02,
                          child: Text(
                            'Lessee 2 Address',
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(fontSize: screenHeight * 0.0085),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: FieldAndLabel(
                                  parent: this,
                                  fieldType: 'Dropdown',
                                  subtitle: 'Region',
                                  errorText: region2Error,
                                  fieldText: region2,
                                  opened: region2DropdownOpened,
                                  dropdownList: allRegions,
                                  valueToChange: 'region2'),
                            ),
                            SizedBox(
                              width: screenWidth * 0.03,
                            ),
                            Expanded(
                              child: FieldAndLabel(
                                  parent: this,
                                  fieldType:
                                      (region2 != '') ? 'Dropdown' : 'Disabled',
                                  subtitle: 'Province',
                                  errorText: province2Error,
                                  fieldText: province2,
                                  opened: province2DropdownOpened,
                                  dropdownList: visibleProvinces2,
                                  valueToChange: 'province2'),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: FieldAndLabel(
                                  parent: this,
                                  fieldType: (province2 != '')
                                      ? 'Dropdown'
                                      : 'Disabled',
                                  subtitle: 'City/Municipality',
                                  errorText: city2Error,
                                  fieldText: city2,
                                  opened: city2DropdownOpened,
                                  dropdownList: visibleCities2,
                                  valueToChange: 'city2'),
                            ),
                            SizedBox(
                              width: screenWidth * 0.03,
                            ),
                            Expanded(
                              child: FieldAndLabel(
                                  parent: this,
                                  fieldType:
                                      (city2 != '') ? 'Dropdown' : 'Disabled',
                                  subtitle: 'Barangay',
                                  errorText: barangay2Error,
                                  fieldText: barangay2,
                                  opened: barangay2DropdownOpened,
                                  dropdownList: visibleBarangays2,
                                  valueToChange: 'barangay2'),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: FieldAndLabel(
                                  parent: this,
                                  fieldType: 'TextField',
                                  subtitle: 'Bldg No./House No./Street',
                                  errorText: house2Error,
                                  hintText: '',
                                  textController: house2Controller),
                            ),
                            SizedBox(
                              width: screenWidth * 0.03,
                            ),
                            Expanded(
                              child: FieldAndLabel(
                                parent: this,
                                fieldType: 'Disabled',
                                subtitle: 'Zip Code',
                                errorText: zipcode2Error,
                                fieldText: zipcode2,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          alignment: Alignment.bottomLeft,
                          height: screenHeight * 0.02,
                          child: Text(
                            'Lessee 2 Contact Number',
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(fontSize: screenHeight * 0.0085),
                          ),
                        ),
                        FieldAndLabel(
                            parent: this,
                            fieldType: 'TextField',
                            subtitle: '(+639XXXXXXXXX)',
                            errorText: contact2Error,
                            hintText: '',
                            textController: contact2Controller),
                      ],
                    )),
                FieldAndLabel(
                    parent: this,
                    fieldType: 'TextField',
                    title: 'For renewal of charges, debit CA/SA No.',
                    errorText: debitError,
                    hintText: '',
                    textController: debitController),
                ElevatedButton(
                    onPressed: () {
                      bool clearToGo = formValidation();

                      if (clearToGo) {
                        Navigator.pushNamed(context, '/leasescreen3');
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