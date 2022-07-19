import 'package:flutter/material.dart';
import 'package:sdbapp/branch/login.dart';
import 'package:sdbapp/services/firestore.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({Key? key}) : super(key: key);

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  String currentType = LoginScreenState.currentType;
  TextEditingController searchController = TextEditingController();
  List<List<String>> leaseViews = [];
  List<List<String>> showViews = [];
  List<Map<String, dynamic>> leaseList = [];
  List<String> searchList = [];
  String searchTerm = '';
  String filterValue = 'All';
  bool searchOpen = false;
  bool filterOpen = false;
  bool inSearch = false;

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
              SizedBox(
                width: deviceWidth * 0.8,
                child: const Divider(thickness: 2.0, color: Color(0xffaaaaaa)),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (!filterOpen)
                      SizedBox(
                        height: 36,
                        child: IconButton(
                          icon: const Icon(Icons.filter_list),
                          color: const Color(0xffaaaaaa),
                          onPressed: () {
                            setState(() => filterOpen = true);
                          },
                        ),
                      )
                    else
                      SizedBox(
                        height: 36,
                        width: deviceWidth * 0.35,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: filterValue,
                            isExpanded: true,
                            //elevation: 16,
                            items: <String>[
                              'All',
                              'Submitted',
                              'Endorsed',
                              'Approved'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                if (newValue == 'All') {
                                  showViews = leaseViews;
                                  filterValue = newValue!;
                                } else {
                                  filterValue = newValue!;
                                  showViews = [];
                                  for (var item in leaseViews) {
                                    if (item[3]
                                        .toLowerCase()
                                        .contains(newValue.toLowerCase())) {
                                      showViews.add(item);
                                    }
                                  }
                                }
                              });
                            },
                            //focusColor: Color(0xffc93033),
                          ),
                        ),
                      ),
                    if (!searchOpen)
                      SizedBox(
                        height: 36,
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                searchOpen = true;
                              });
                            },
                            color: const Color(0xffaaaaaa),
                            icon: const Icon(Icons.search)),
                      )
                    else
                      SizedBox(
                        width: deviceWidth * 0.35,
                        child: TextField(
                            controller: searchController,
                            style: const TextStyle(
                                fontSize: 14, height: 1.0, color: Colors.grey),
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Color(0xffaaaaaa)),
                                borderRadius:
                                    BorderRadius.circular(deviceHeight * 0.02),
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
                                      searchController.clear();
                                      setState(() {
                                        filterValue = 'All';
                                        showViews = leaseViews;
                                        inSearch = false;
                                      });
                                    }
                                  });
                                },
                                icon: Icon(
                                  inSearch ? Icons.close : Icons.search,
                                  color: const Color(0xff444444),
                                  size: deviceWidth * 0.05,
                                ),
                              ),
                              suffixIconConstraints: const BoxConstraints(
                                  maxHeight: 36, maxWidth: 36),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 2.0, color: Color(0xffaaaaaa)),
                                borderRadius:
                                    BorderRadius.circular(deviceHeight * 0.02),
                              ),
                              filled: true,
                              fillColor: Colors.white70,
                              isDense: true,
                              contentPadding: const EdgeInsets.all(10.0),
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
                                Flexible(
                                  child: Column(
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
                                          Flexible(child: Text(showViews[i][2], overflow: TextOverflow.ellipsis,)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                if (currentType == "verifier")
                                  SizedBox(
                                    width: 80,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Map<String, dynamic> tosend = {};
                                        for (var object in leaseList) {
                                          if (showViews[i][0] ==
                                                  object['lessee1'] &&
                                              showViews[i][1] ==
                                                  object['branch'] &&
                                              showViews[i][2] ==
                                                  object['datetime']) {
                                            tosend = object;
                                          }
                                        }
                                        Navigator.pushNamed(
                                            context, '/leaseview',
                                            arguments: tosend);
                                      },
                                      child: Text(
                                        (showViews[i][3] == 'endorsed' ||
                                                showViews[i][3] == 'approved')
                                            ? 'View'
                                            : 'Review',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  )
                                else
                                  SizedBox(
                                    width: 80,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Map<String, dynamic> tosend = {};
                                        for (var object in leaseList) {
                                          if (showViews[i][0] ==
                                                  object['lessee1'] &&
                                              showViews[i][1] ==
                                                  object['branch'] &&
                                              showViews[i][2] ==
                                                  object['datetime']) {
                                            tosend = object;
                                          }
                                        }
                                        Navigator.pushNamed(
                                            context, '/leaseview',
                                            arguments: tosend);
                                      },
                                      child: Text(
                                        (showViews[i][3] == 'submitted' ||
                                                showViews[i][3] == 'approved')
                                            ? 'View'
                                            : 'Review',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            const Divider(
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
