import 'package:flutter/material.dart';
import 'package:sdbapp/services/firestore.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({Key? key}) : super(key: key);

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  bool justonce = false;
  @override
  Widget build(BuildContext context) {
    void getList() async {
      justonce = true;
      var leases = await FirestoreService.readFirestore('leases');
      for (var lease in leases) {
        lease.isEmpty;
      }
    }

    if (justonce == false) getList();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('PENDING APPLICATIONS'),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/leaseview');
                },
                child: Text('Review'))
          ],
        ),
      ),
    );
  }
}
