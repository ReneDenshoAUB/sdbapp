import 'package:flutter/material.dart';
import 'package:sdbapp/form/leasescreen2.dart';

class ApplicationView extends StatefulWidget {
  const ApplicationView({Key? key}) : super(key: key);

  @override
  State<ApplicationView> createState() => _ApplicationViewState();
}

class _ApplicationViewState extends State<ApplicationView> {
  bool hasLessee2 = LesseeDetailsScreenState.hasLessee2;

  //Lease Details
  String branch = '085 XAVIER SAN JUAN';
  String sdbNumber = '15';
  String size = '10x10';
  String annualFee = 'PHP 2,200.00';
  String keyDeposit = 'PHP 1,000.00';
  String leaseDate = 'July 5, 2022';
  String expiryDate = 'January 15, 2023';
  //Lessee Details
  String lessee1Name = 'Rene Lee T. Aquitania';
  String lessee1Address = 'A-154 Poblacion La Trinidad, Bengueasdfddsfdfsdfsdfst';
  String lessee1ContactNo = '+639771704267';
  String? lessee2Name = 'Rene Lee T. Aquitania';
  String? lessee2Address = 'A-154 Poblacion La Trinidad, Benguet';
  String? lessee2ContactNo = '+639771704267';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('APPLICATION DETAILS'),
      ),
      body: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'SDB Lease Details',
              style: Theme.of(context).textTheme.headline6?.copyWith(
                  fontSize: MediaQuery.of(context).size.height * 0.04),
            ),
            Container(
              decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: Color(0xff3d3d3d)))),
              margin: EdgeInsets.fromLTRB(
                  0, 0, 0, MediaQuery.of(context).size.height * 0.03),
              height: MediaQuery.of(context).size.height * 0.03,
              width: MediaQuery.of(context).size.width * 0.25,
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.31,
                  child: Text(
                    'Branch',
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.02),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.31,
                  child: Text(
                    'Annual Fee',
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.02),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.31,
                  child: Text(
                    'Lease Date',
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.02),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.31,
                  child: Text(
                    branch,
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.017),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.31,
                  child: Text(
                    annualFee,
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.0177),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.31,
                  child: Text(
                    leaseDate,
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.017),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.31,
                  child: Text(
                    'SDB Number',
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.02),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.31,
                  child: Text(
                    'Deposit For Keys',
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.02),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.31,
                  child: Text(
                    'Expiry Date',
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.02),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.31,
                  child: Text(
                    sdbNumber,
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.017),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.31,
                  child: Text(
                    keyDeposit,
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.0177),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.31,
                  child: Text(
                    expiryDate,
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.017),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Text(
              'Size',
              style: Theme.of(context).textTheme.headline6?.copyWith(
                  fontSize: MediaQuery.of(context).size.height * 0.02),
            ),
            Text(
              size,
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  fontSize: MediaQuery.of(context).size.height * 0.017),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Text(
              'SDB Lessee Details',
              style: Theme.of(context).textTheme.headline6?.copyWith(
                  fontSize: MediaQuery.of(context).size.height * 0.04),
            ),
            Container(
              decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: Color(0xff3d3d3d)))),
              margin: EdgeInsets.fromLTRB(
                  0, 0, 0, MediaQuery.of(context).size.height * 0.03),
              height: MediaQuery.of(context).size.height * 0.03,
              width: MediaQuery.of(context).size.width * 0.25,
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4675,
                  child: Text(
                    'Lessee 1',
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.03),
                  ),
                ),
                Visibility(
                  visible: hasLessee2,
                  child: Text(
                    'Lessee 2',
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.03),
                  ),
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4675,
                  child: Text(
                    'Name',
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.02),
                  ),
                ),
                Visibility(
                  visible: hasLessee2,
                  child: Text(
                    'Name',
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.02),
                  ),
                )
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4675,
                  child: Text(
                    lessee1Name,
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.017),
                  ),
                ),
                Visibility(
                  visible: hasLessee2,
                  child: Text(
                    '$lessee2Name',
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.017),
                  ),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4675,
                  child: Text(
                    'Address',
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.02),
                  ),
                ),
                Visibility(
                  visible: hasLessee2,
                  child: Text(
                    'Address',
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.02),
                  ),
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4675,
                  child: Text(
                    lessee1Address,
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.017),
                  ),
                ),
                Visibility(
                  visible: hasLessee2,
                  child: Text(
                    '$lessee2Address',
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.017),
                  ),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4675,
                  child: Text(
                    'Contact Number',
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.02),
                  ),
                ),
                Visibility(
                  visible: hasLessee2,
                  child: Text(
                    'Contact Number',
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.02),
                  ),
                ) 
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4675,
                  child: Text(
                    lessee1ContactNo,
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.017),
                  ),
                ),
                Visibility(
                  visible: hasLessee2,
                  child: Text(
                    '$lessee2ContactNo',
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.017),
                  ),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.075,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.075,
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('yeet'),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.075,
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all<Color>(Colors.black12),
                        side: MaterialStateProperty.all(const BorderSide(
                            width: 4.0, color: Color(0xffc93033))),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white)),
                    child: Text(
                      'yote',
                      style: Theme.of(context)
                          .textTheme
                          .button
                          ?.copyWith(color: const Color(0xffc93033)),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
