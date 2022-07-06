import 'package:flutter/material.dart';
import 'package:sdbapp/services/firestore.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({Key? key}) : super(key: key);

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  List<List<String>> leaseViews = [];
  List<Map<String, dynamic>> leaseList = [];
  List<Key?> keys = [];
  bool justonce = false;

  @override
  Widget build(BuildContext context) {
    void getList() async {
      justonce = true;
      var leases = await FirestoreService.readFirestore('leases');
      leaseList = leases;
      int i = 0;
      for (var lease in leases) {
        leaseViews
            .insert(0, [lease['lessee1'], lease['branch'], lease['datetime']]);
        i++;
      }
      setState(() {});
      print("This is the part = $leaseViews");
    }

    if (justonce == false) getList();
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: deviceHeight * 0.0732,
              ),
              Text(
                'PENDING APPLICATIONS',
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(fontSize: 22),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: deviceHeight * 0.75,
                width: deviceWidth * 0.9,
                padding: EdgeInsets.all(deviceHeight * 0.041923865),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xffdcdcdc),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      spreadRadius: -7.0,
                      blurRadius: 7.0,
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (int i = 0; i < leaseViews.length; i++)
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      leaseViews[i][0],
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                    ),
                                    Row(
                                      children: [
                                        Text("${leaseViews[i][1]} "),
                                        Text(leaseViews[i][2]),
                                      ],
                                    ),
                                  ],
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/leaseview',
                                        arguments: leaseList[
                                            (leaseViews.length - 1) - i]);
                                  },
                                  child: Text(
                                    'Review',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              thickness: 1.5,
                              color: Color(0xffaaaaaa),
                            ),
                          ],
                        ),
                    ],
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
