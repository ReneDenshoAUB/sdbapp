import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sdbapp/form/leasescreen4.dart';
import 'package:sdbapp/services/auth.dart';

class FirestoreService {
  static Future<void> sendToFirestore(Lease lease) async {
    var user = AuthService().user!;
    var ref = FirebaseFirestore.instance.collection('leases').doc(user.uid);

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
    };

    return ref.set(data, SetOptions(merge: true));
  }

  static Future<List<Map<String, dynamic>>> readUsers() async {
    var ref = FirebaseFirestore.instance.collection('users');
    var snapshot = await ref.get();
    var data = snapshot.docs.map((e) => e.data());
    return data.toList();
  }
}
