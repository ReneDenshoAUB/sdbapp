import 'package:flutter/material.dart';

class LesseeDetailsScreen extends StatefulWidget {
  const LesseeDetailsScreen({Key? key}) : super(key: key);

  @override
  State<LesseeDetailsScreen> createState() => _LesseeDetailsScreenState();
}

class _LesseeDetailsScreenState extends State<LesseeDetailsScreen> {

  List<String> provinces = ['Province 1', 'Province 2', 'Province 3'];
  String? selectedProvince;

  List<String> cities = ['City 1', 'City 2', 'City 3'];
  String? selectedCity;

  List<String> barangays = ['Barangay 1', 'Barangay 2', 'Barangay 3'];
  String? selectedBarangay;

  bool hasLessee2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LESSEE DETAILS"),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Lessee 1',
                  style: Theme.of(context).textTheme.headline5,
                ),
                Container(
                  width: 390.0,
                  child: Text(
                    '(First Name, Middle Initial, Last Name)',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
                SizedBox(height: 5.0),
                TextFormField(
                  style: Theme.of(context).textTheme.bodyText1,
                  decoration: InputDecoration(
                    hintText: 'e.g. Juan H. dela Cruz',
                    hintStyle: Theme.of(context).textTheme.bodyText2?.copyWith(color: Color(0xff686868)),
                    border: Theme.of(context).inputDecorationTheme.border,
                    filled: true,
                    fillColor: Theme.of(context).inputDecorationTheme.fillColor,
                  ),
                ),
                SizedBox(height: 30.0,),
                Text(
                  'Address of Lessee 1',
                  style: Theme.of(context).textTheme.headline5,
                ),
                Container(
                  width: 390.0,
                  child: Text(
                    'Bldg No./House No./Street',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
                SizedBox(height: 5.0),
                TextFormField(
                  style: Theme.of(context).textTheme.bodyText1,
                  decoration: InputDecoration(
                    hintText: 'BLDG. NO/HOUSE NO./STREET',
                    hintStyle: Theme.of(context).textTheme.bodyText2?.copyWith(color: Color(0xff686868)),
                    border: Theme.of(context).inputDecorationTheme.border,
                    filled: true,
                    fillColor: Theme.of(context).inputDecorationTheme.fillColor,
                  ),
                ),
                SizedBox(height: 15.0,),
                Row(
                  children: [
                    Container(
                      width: 183.0,
                      child: Text(
                        'Province',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                    SizedBox(width: 20,),
                    Container(
                      width: 183.0,
                      child: Text(
                        'City',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.0),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                      height: 35.0,
                      width: 183.0,
                      decoration: BoxDecoration(
                          color: Color(0xffeae0d6),
                          borderRadius: BorderRadius.circular(5.0)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DropdownButtonFormField<String>(
                            decoration: InputDecoration.collapsed(
                              hintText: 'PROVINCE',
                              hintStyle: Theme.of(context).textTheme.bodyText1?.copyWith(color: Color(0xff686868),),
                            ),
                            dropdownColor: Color(0xffeae0d6),
                            value: selectedProvince,
                            items: provinces.map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(item, style: Theme.of(context).textTheme.bodyText1,),
                            )).toList(),
                            onChanged: (item) => setState(() => selectedProvince = item),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20.0,),
                    Container(
                      padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                      height: 35.0,
                      width: 183.0,
                      decoration: BoxDecoration(
                          color: Color(0xffeae0d6),
                          borderRadius: BorderRadius.circular(5.0)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DropdownButtonFormField<String>(
                            decoration: InputDecoration.collapsed(
                              hintText: 'CITY',
                              hintStyle: Theme.of(context).textTheme.bodyText1?.copyWith(color: Color(0xff686868),),
                            ),
                            dropdownColor: Color(0xffeae0d6),
                            value: selectedCity,
                            items: cities.map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(item, style: Theme.of(context).textTheme.bodyText1,),
                            )).toList(),
                            onChanged: (item) => setState(() => selectedCity = item),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.0,),
                Row(
                  children: [
                    Container(
                      width: 183.0,
                      child: Text(
                        'Barangay',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                    SizedBox(width: 20,),
                    Container(
                      width: 183.0,
                      child: Text(
                        'Zip Code',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.0,),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                      height: 35.0,
                      width: 183.0,
                      decoration: BoxDecoration(
                          color: Color(0xffeae0d6),
                          borderRadius: BorderRadius.circular(5.0)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DropdownButtonFormField<String>(
                            decoration: InputDecoration.collapsed(
                              hintText: 'BARANGAY',
                              hintStyle: Theme.of(context).textTheme.bodyText1?.copyWith(color: Color(0xff686868),),
                            ),
                            dropdownColor: Color(0xffeae0d6),
                            value: selectedBarangay,
                            items: barangays.map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(item, style: Theme.of(context).textTheme.bodyText1,),
                            )).toList(),
                            onChanged: (item) => setState(() => selectedBarangay = item),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20,),
                    Container(
                      height: 35.0,
                      width: 183.0,
                      padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                      decoration: BoxDecoration(
                        color: Color(0xffd7dcdd),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Yeet',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                      ),
                      child: SizedBox(
                        height: 30.0,
                        width: 30.0,
                        child: Checkbox(
                          value: hasLessee2,
                          onChanged: (value) {
                            setState(() {
                              hasLessee2 = value as bool;
                            });
                          },
                        ),
                      ),
                    ),
                    Text(
                      'Add Lessee 2',
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(fontFamily: 'Gilroy-Bold'),
                    ),

                  ],
                ),
                SizedBox(height: 40.0,),
                Visibility(
                  visible: hasLessee2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lessee 2',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      Container(
                        width: 390.0,
                        child: Text(
                          '(First Name, Middle Initial, Last Name)',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      TextFormField(
                        style: Theme.of(context).textTheme.bodyText1,
                        decoration: InputDecoration(
                          hintText: 'e.g. Juan H. dela Cruz',
                          hintStyle: Theme.of(context).textTheme.bodyText2?.copyWith(color: Color(0xff686868)),
                          border: Theme.of(context).inputDecorationTheme.border,
                          filled: true,
                          fillColor: Theme.of(context).inputDecorationTheme.fillColor,
                        ),
                      ),
                      SizedBox(height: 30.0,),
                      Text(
                        'Address of Lessee 2',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      Container(
                        width: 390.0,
                        child: Text(
                          'Bldg No./House No./Street',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      TextFormField(
                        style: Theme.of(context).textTheme.bodyText1,
                        decoration: InputDecoration(
                          hintText: 'BLDG. NO/HOUSE NO./STREET',
                          hintStyle: Theme.of(context).textTheme.bodyText2?.copyWith(color: Color(0xff686868)),
                          border: Theme.of(context).inputDecorationTheme.border,
                          filled: true,
                          fillColor: Theme.of(context).inputDecorationTheme.fillColor,
                        ),
                      ),
                      SizedBox(height: 15.0,),
                      Row(
                        children: [
                          Container(
                            width: 183.0,
                            child: Text(
                              'Province',
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ),
                          SizedBox(width: 20,),
                          Container(
                            width: 183.0,
                            child: Text(
                              'City',
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.0),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                            height: 35.0,
                            width: 183.0,
                            decoration: BoxDecoration(
                                color: Color(0xffeae0d6),
                                borderRadius: BorderRadius.circular(5.0)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                DropdownButtonFormField<String>(
                                  decoration: InputDecoration.collapsed(
                                    hintText: 'PROVINCE',
                                    hintStyle: Theme.of(context).textTheme.bodyText1?.copyWith(color: Color(0xff686868),),
                                  ),
                                  dropdownColor: Color(0xffeae0d6),
                                  value: selectedProvince,
                                  items: provinces.map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(item, style: Theme.of(context).textTheme.bodyText1,),
                                  )).toList(),
                                  onChanged: (item) => setState(() => selectedProvince = item),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 20.0,),
                          Container(
                            padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                            height: 35.0,
                            width: 183.0,
                            decoration: BoxDecoration(
                                color: Color(0xffeae0d6),
                                borderRadius: BorderRadius.circular(5.0)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                DropdownButtonFormField<String>(
                                  decoration: InputDecoration.collapsed(
                                    hintText: 'CITY',
                                    hintStyle: Theme.of(context).textTheme.bodyText1?.copyWith(color: Color(0xff686868),),
                                  ),
                                  dropdownColor: Color(0xffeae0d6),
                                  value: selectedCity,
                                  items: cities.map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(item, style: Theme.of(context).textTheme.bodyText1,),
                                  )).toList(),
                                  onChanged: (item) => setState(() => selectedCity = item),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.0,),
                      Row(
                        children: [
                          Container(
                            width: 183.0,
                            child: Text(
                              'Barangay',
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ),
                          SizedBox(width: 20,),
                          Container(
                            width: 183.0,
                            child: Text(
                              'Zip Code',
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.0,),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                            height: 35.0,
                            width: 183.0,
                            decoration: BoxDecoration(
                                color: Color(0xffeae0d6),
                                borderRadius: BorderRadius.circular(5.0)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                DropdownButtonFormField<String>(
                                  decoration: InputDecoration.collapsed(
                                    hintText: 'BARANGAY',
                                    hintStyle: Theme.of(context).textTheme.bodyText1?.copyWith(color: Color(0xff686868),),
                                  ),
                                  dropdownColor: Color(0xffeae0d6),
                                  value: selectedBarangay,
                                  items: barangays.map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(item, style: Theme.of(context).textTheme.bodyText1,),
                                  )).toList(),
                                  onChanged: (item) => setState(() => selectedBarangay = item),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 20,),
                          Container(
                            height: 35.0,
                            width: 183.0,
                            padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                            decoration: BoxDecoration(
                              color: Color(0xffd7dcdd),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Yeet',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40.0,),
                Text(
                  'Lessee 1 Contact Number',
                  style: Theme.of(context).textTheme.headline5,
                ),
                Container(
                  width: 390.0,
                  child: Text(
                    '(+639XXXXXXXXX)',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
                SizedBox(height: 5.0),
                TextFormField(
                  style: Theme.of(context).textTheme.bodyText1,
                  decoration: InputDecoration(
                    hintText: 'e.g. +63987654321',
                    hintStyle: Theme.of(context).textTheme.bodyText2?.copyWith(color: Color(0xff686868)),
                    border: Theme.of(context).inputDecorationTheme.border,
                    filled: true,
                    fillColor: Theme.of(context).inputDecorationTheme.fillColor,
                  ),
                ),
                SizedBox(height: 40.0,),
                Visibility(
                  visible: hasLessee2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lessee 2 Contact Number',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      Container(
                        width: 390.0,
                        child: Text(
                          '(+639XXXXXXXXX)',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      TextFormField(
                        style: Theme.of(context).textTheme.bodyText1,
                        decoration: InputDecoration(
                          hintText: 'e.g. +63987654321',
                          hintStyle: Theme.of(context).textTheme.bodyText2?.copyWith(color: Color(0xff686868)),
                          border: Theme.of(context).inputDecorationTheme.border,
                          filled: true,
                          fillColor: Theme.of(context).inputDecorationTheme.fillColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40.0,),
                Center(
                  child: Container(
                    width: 150.0,
                    height: 50.0,
                    child: ElevatedButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Next '),
                          const Icon(Icons.arrow_circle_right)
                        ],
                      ),
                      onPressed: () => Navigator.pushNamed(context, '/leasescreen3'),
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
