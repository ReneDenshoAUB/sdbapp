import 'package:flutter/material.dart';
import 'package:sdbapp/services/firestore.dart';
import 'package:textfield_search/textfield_search.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({Key? key}) : super(key: key);

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  TextEditingController searchController = TextEditingController();
  List<List<String>> leaseViews = [];
  List<List<String>> showViews = [];
  List<Map<String, dynamic>> leaseList = [];
  List<String> searchList = [];
  String searchTerm = '';
  bool searchOpen = false;
  bool inSearch = false;
  bool inAll = true;
  bool inSubmitted = false;
  bool inEndorsed = false;
  bool inApproved = false;

  void getList() async {
    var leases = await FirestoreService.readFirestore('leases');
    leaseList = leases;
    for (var lease in leases) {
      leaseViews.insert(0, [
        lease['lessee1'],
        lease['branch'],
        lease['datetime'],
        lease['status']
      ]);
      searchList.add(lease['lessee1']);
    }
    setState(() {});
    print("This is the part = $leaseViews");
  }

  @override
  void initState() {
    super.initState();
    searchOpen = false;
    getList();
    showViews = leaseViews;
  }

  @override
  Widget build(BuildContext context) {
    if (inSearch) searchController.text = searchTerm;
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
                height: deviceHeight * 0.03,
              ),
              Text(
                'SDB LEASE APPLICATIONS',
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(fontSize: deviceWidth * 0.05352798053),
              ),
              Visibility(
                  visible: !searchOpen,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                      height: 36,
                      child: Padding(
                          padding: EdgeInsets.only(right: deviceWidth * 0.1),
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  searchOpen = true;
                                });
                              },
                              icon: Icon(Icons.search))),
                    ),
                  )),
              Visibility(
                visible: searchOpen,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: deviceWidth * 0.1),
                    child: SizedBox(
                      width: deviceWidth * 0.80,
                      child: TextFieldSearch(
                          controller: searchController,
                          label: 'Search',
                          initialList: searchList,
                          textStyle: const TextStyle(
                              fontSize: 14, height: 1.0, color: Colors.grey),
                          decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffaaaaaa)),
                              // borderRadius:
                              //     BorderRadius.circular(deviceHeight * 0.02),
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  if (inSearch == false) {
                                    searchTerm = searchController.text;
                                    var lastShowViews = showViews;
                                    showViews = [];
                                    for (var item in lastShowViews) {
                                      if (item[0]
                                          .toLowerCase()
                                          .contains(searchTerm)) {
                                        showViews.add(item);
                                      }
                                    }
                                    inSearch = true;
                                  } else {
                                    showViews = leaseViews;
                                    inSearch = false;
                                    inAll = true;
                                    inSubmitted = false;
                                    inEndorsed = false;
                                    inApproved = false;
                                    searchController.clear();
                                  }
                                });
                              },
                              icon: Icon(
                                inSearch ? Icons.close : Icons.search,
                                color: Color(0xff444444),
                                size: deviceWidth * 0.05,
                              ),
                            ),
                            suffixIconConstraints:
                                BoxConstraints(maxHeight: 36, maxWidth: 36),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 2.0, color: Color(0xffaaaaaa)),
                              // borderRadius:
                              //     BorderRadius.circular(deviceHeight * 0.02),
                            ),
                            filled: true,
                            fillColor: Colors.white70,
                            isDense: true,
                            contentPadding: EdgeInsets.all(10.0),
                          ),
                          onSubmitted: (String value) {
                            searchTerm = searchController.text;
                            setState(() {
                              var lastShowViews = showViews;
                              showViews = [];
                              for (var item in lastShowViews) {
                                if (item[0]
                                    .toLowerCase()
                                    .contains(searchTerm)) {
                                  showViews.add(item);
                                }
                              }
                              inSearch = true;
                            });
                          }),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: deviceWidth * 0.8,
                child: const Divider(thickness: 2.0, color: Color(0xffaaaaaa)),
              ),
              SizedBox(
                height: deviceHeight * 0.02928257686,
                width: deviceWidth * 0.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (inAll)
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: deviceWidth * 0.01),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xffe27a84))),
                          child: Text(
                            'All',
                            style: TextStyle(fontSize: 8),
                          ),
                        ),
                      )
                    else
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: deviceWidth * 0.01),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              showViews = leaseViews;
                              inAll = true;
                              inSubmitted = false;
                              inEndorsed = false;
                              inApproved = false;
                            });
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(28.0),
                                  side: const BorderSide(
                                      width: 1.5, color: Color(0xffe27a84))),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color(0xffffffff)),
                          ),
                          child: Text(
                            'All',
                            style: TextStyle(
                                fontSize: 8, color: Color(0xffe27a84)),
                          ),
                        ),
                      ),
                    if (inSubmitted)
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: deviceWidth * 0.01),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xffe27a84))),
                          child: Text(
                            'Submitted',
                            style: TextStyle(fontSize: 8),
                          ),
                        ),
                      )
                    else
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: deviceWidth * 0.01),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              showViews = [];
                              for (var item in leaseViews) {
                                if (item[3]
                                    .toLowerCase()
                                    .contains('submitted')) {
                                  showViews.add(item);
                                }
                              }
                              inAll = false;
                              inSubmitted = true;
                              inEndorsed = false;
                              inApproved = false;
                            });
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(28.0),
                                  side: const BorderSide(
                                      width: 1.5, color: Color(0xffe27a84))),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color(0xffffffff)),
                          ),
                          child: Text(
                            'Submitted',
                            style: TextStyle(
                                fontSize: 8, color: Color(0xffe27a84)),
                          ),
                        ),
                      ),
                    if (inEndorsed)
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: deviceWidth * 0.01),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xffe27a84))),
                          child: Text(
                            'Endorsed',
                            style: TextStyle(fontSize: 8),
                          ),
                        ),
                      )
                    else
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: deviceWidth * 0.01),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              showViews = [];
                              for (var item in leaseViews) {
                                if (item[3]
                                    .toLowerCase()
                                    .contains('endorsed')) {
                                  showViews.add(item);
                                }
                              }
                              inAll = false;
                              inSubmitted = false;
                              inEndorsed = true;
                              inApproved = false;
                            });
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(28.0),
                                  side: const BorderSide(
                                      width: 1.5, color: Color(0xffe27a84))),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color(0xffffffff)),
                          ),
                          child: Text(
                            'Endorsed',
                            style: TextStyle(
                                fontSize: 8, color: Color(0xffe27a84)),
                          ),
                        ),
                      ),
                    if (inApproved)
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: deviceWidth * 0.01),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xffe27a84))),
                          child: Text(
                            'Approved',
                            style: TextStyle(fontSize: 8),
                          ),
                        ),
                      )
                    else
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: deviceWidth * 0.01),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              showViews = [];
                              for (var item in leaseViews) {
                                if (item[3]
                                    .toLowerCase()
                                    .contains('approved')) {
                                  showViews.add(item);
                                }
                              }
                              inAll = false;
                              inSubmitted = false;
                              inEndorsed = false;
                              inApproved = true;
                            });
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(28.0),
                                  side: const BorderSide(
                                      width: 1.5, color: Color(0xffe27a84))),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color(0xffffffff)),
                          ),
                          child: Text(
                            'Approved',
                            style: TextStyle(
                                fontSize: 8, color: Color(0xffe27a84)),
                          ),
                        ),
                      ),
                    Icon(Icons.filter_list, color: Color(0xffaaaaaa)),
                  ],
                ),
              ),
              Container(
                height: deviceHeight * 0.70,
                width: deviceWidth * 0.9,
                margin: EdgeInsets.all(deviceHeight * 0.01),
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
                      for (int i = 0; i < showViews.length; i++)
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      showViews[i][0],
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                    ),
                                    Row(
                                      children: [
                                        Text("${showViews[i][1]} "),
                                        Text(showViews[i][2]),
                                      ],
                                    ),
                                  ],
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Map<String, dynamic> tosend = {};
                                    for (var object in leaseList) {
                                      if (showViews[i][0] ==
                                              object['lessee1'] &&
                                          showViews[i][1] == object['branch'] &&
                                          showViews[i][2] ==
                                              object['datetime']) {
                                        tosend = object;
                                      }
                                    }
                                    Navigator.pushNamed(context, '/leaseview',
                                        arguments: tosend);
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
