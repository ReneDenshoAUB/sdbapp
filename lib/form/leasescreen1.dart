import 'package:flutter/material.dart';

class LeaseDetailsScreen extends StatefulWidget {
  const LeaseDetailsScreen({Key? key}) : super(key: key);

  @override
  State<LeaseDetailsScreen> createState() => _LeaseDetailsScreenState();
}

class _LeaseDetailsScreenState extends State<LeaseDetailsScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<String> sizes = ['5x5', '5x10', '10x10'];
  String? selectedSize;

  String formattedDateTime() {
    var MONTHS = ["January", "February", "March",
                  "April", "May", "June", "July",
                  "August", "September", "October",
                  "November", "December"];
    DateTime now = new DateTime.now();
    return MONTHS[now.month-1] + " " + now.day.toString()+", " + now.year.toString();
  }

  String price(String? selectedSize){
    String price = '';
    if(selectedSize == '5x5'){
      price = 'PHP 800.00';
    } else if(selectedSize == '5x10'){
      price = 'PHP 1650.00';
    } else if(selectedSize == '10x10'){
      price = 'PHP 2200.00';
    }

    return price;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('SDB LEASE DETAILS'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Branch',
                style: Theme.of(context).textTheme.headline5,
              ),
              Container(
                height: 35.0,
                width: 390.0,
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
                      "January 15, " + (DateTime.now().year + 1).toString(),
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.0,),
              Row(
                children: [
                  Text(
                    'SDB Number',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  SizedBox(width: 57,),
                  Text(
                    'Size',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ],
              ),
              Text(
                  '(Automatically chosen for you)',
                  style: Theme.of(context).textTheme.bodyText2,
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
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
                          price(selectedSize),
                          style: Theme.of(context).textTheme.bodyText1,
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
                        Form(
                          child: DropdownButtonFormField<String>(
                            key: _formKey,
                            validator: (value) {
                              if(value == null) {
                                return 'Choose a size';
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration.collapsed(
                                hintText: 'Choose a size',
                                hintStyle: Theme.of(context).textTheme.bodyText1?.copyWith(color: Color(0xff686868),),
                            ),
                            dropdownColor: Color(0xffeae0d6),
                            value: selectedSize,
                             items: sizes.map((item) => DropdownMenuItem(
                                value: item,
                                child: Text(item, style: Theme.of(context).textTheme.bodyText1),
                              ),
                            ).toList(),
                            onChanged: (item) => setState(() => selectedSize = item),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.0,),
              Row(
                children: [
                  Container(
                    width: 183.0,
                    child: Text(
                      'Date Leased',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                  SizedBox(width: 20.0,),
                  Container(
                    width: 183.0,
                    child: Text(
                      'Expiry Date',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 183.0,
                    child: Text(
                      '(Date Today)',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                  SizedBox(width: 20.0,),
                  Container(
                    width: 183.0,
                    child: Text(
                      '(The following January 15)',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5.0,),
              Row(
                children: [
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
                          formattedDateTime(),
                          style: Theme.of(context).textTheme.bodyText1,
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
                          "January 15, " + (DateTime.now().year + 1).toString(),
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50.0,
              ),
              Center(
                child: Text(
                  'We\'ll need your personal information too.',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Center(
                child: Container(
                  width: 150.0,
                  height: 50.0,
                  child: ElevatedButton(
                    style: Theme.of(context).elevatedButtonTheme.style,
                    onPressed: () {
                      final isValid = _formKey.currentState?.validate();
                      Navigator.pushNamed(context, '/leasescreen2');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Next ',
                        ),
                        const Icon(Icons.arrow_circle_right),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
