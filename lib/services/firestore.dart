import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sdbapp/form/leasescreen4.dart';

class FirestoreService {
  static Future<void> sendToFirestore(Lease lease) async {
    var now = DateTime.now();
    var month = now.month.toString().padLeft(2, '0');
    var day = now.day.toString().padLeft(2, '0');
    var year = now.year.toString().padLeft(2, '0');
    var hour = now.hour.toString().padLeft(2, '0');
    var min = now.minute.toString().padLeft(2, '0');
    var second = now.second.toString().padLeft(2, '0');
    var datetimenow = "$month-$day-$year $hour:$min:$second";
    var ref = FirebaseFirestore.instance
        .collection('leases')
        .doc("$datetimenow ${lease.lessee1}");

    var data = {
      'branch': lease.branch,
      'sdbnumber': lease.sdbnumber,
      'size': lease.size,
      'annualfee': lease.annualfee,
      'depositfee': lease.depositfee,
      'dateleased': lease.dateleased,
      'expirydate': lease.expirydate,
      'lessee1': lease.lessee1,
      'address1': lease.address1,
      'contact1': lease.contact1,
      'lessee2': lease.lessee2,
      'address2': lease.address2,
      'contact2': lease.contact2,
      'sigurl1': lease.sigurl1,
      'sigurl2': lease.sigurl2 ?? '',
      'datetime': datetimenow,
      'debitto': lease.debit,
      'status': 'submitted',
    };

    //WAG MUNA ILAGAY TO KASI NAKAKARAMI NA TO NG READ LOL

    
    await (FirebaseFirestore.instance.collection('branches')).doc(lease.branch.substring(6)).update({'SDBs.${lease.sdbnumber}': 'unavailable'});

    return ref.set(data, SetOptions(merge: true));
  }

  static Future<List<Map<String, dynamic>>> readFirestore(
      String collection) async {
    var ref = FirebaseFirestore.instance.collection(collection);
    var snapshot = await ref.get();
    var data = snapshot.docs.map((e) => e.data());
    return data.toList();
  }
}
