import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sdbapp/branch/login.dart';

class LeaseViewScreeen extends StatelessWidget {
  const LeaseViewScreeen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final leasedetails =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    bool hasLessee2;

    if (leasedetails['lessee2'] == "") {
      hasLessee2 = false;
    } else {
      hasLessee2 = true;
    }

    print('yooo $leasedetails');

    return Scaffold(
      backgroundColor: Colors.white,
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
                    '${leasedetails['branch']}',
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.017),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.31,
                  child: Text(
                    '${leasedetails['annualfee']}',
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.0177),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.31,
                  child: Text(
                    '${leasedetails['dateleased']}',
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
                    '${leasedetails['sdbnumber']}',
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.017),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.31,
                  child: Text(
                    '${leasedetails['depositfee']}',
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.0177),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.31,
                  child: Text(
                    '${leasedetails['debit']}',
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
              '${leasedetails['size']}',
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
                    '${leasedetails['lessee1']}',
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.017),
                  ),
                ),
                Visibility(
                  visible: hasLessee2,
                  child: Text(
                    '${leasedetails['lessee2']}',
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
                    '${leasedetails['address1']}',
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.017),
                  ),
                ),
                Visibility(
                  visible: hasLessee2,
                  child: Text(
                    '${leasedetails['address2']}',
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
                    '${leasedetails['contact1']}',
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.017),
                  ),
                ),
                Visibility(
                  visible: hasLessee2,
                  child: Text(
                    '${leasedetails['contact2']}',
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
                    onPressed: () {
                      final docUser = FirebaseFirestore.instance
                          .collection('leases')
                          .doc(
                              '${leasedetails['datetime']} ${leasedetails['lessee1']}');

                      docUser.update({
                        'status': (LoginScreenState.currentType == 'approver')
                            ? 'approved'
                            : 'endorsed'
                      });

                      Navigator.pushNamed(context, '/listview');
                    },
                    child: Text(
                        (LoginScreenState.currentType == 'approver')
                            ? 'Approve'
                            : 'Endorse',
                        style: TextStyle(fontSize: 12)),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.075,
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: ElevatedButton(
                    onPressed: () {
                      final docUser = FirebaseFirestore.instance
                          .collection('leases')
                          .doc(
                              '${leasedetails['datetime']} ${leasedetails['lessee1']}');

                      docUser.delete();
                      Navigator.pushNamed(context, '/listview');
                    },
                    style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all<Color>(Colors.black12),
                        side: MaterialStateProperty.all(const BorderSide(
                            width: 4.0, color: Color(0xffc93033))),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white)),
                    child: Text(
                      'Reject',
                      style: Theme.of(context).textTheme.button?.copyWith(
                          color: const Color(0xffc93033), fontSize: 12),
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
