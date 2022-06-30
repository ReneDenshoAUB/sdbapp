import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sdbapp/form/leasescreen3.dart';
import 'package:sdbapp/services/auth.dart';
import 'package:sdbapp/services/firestore.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  UploadTask? uploadTask;
  UploadTask? firestoreTask;
  String url = '';
  int justonce = 0;

  Future uploadFile(Uint8List? signature, int count) async {
    var user = AuthService().user!;
    final path = 'signatures/${user.uid}_$count';
    final ref = FirebaseStorage.instance.ref().child(path);
    uploadTask = ref.putData(signature!);
    final snapshot = await uploadTask!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    setState(() {
      url = urlDownload;
    });
  }

  @override
  Widget build(BuildContext context) {
    final lease = ModalRoute.of(context)!.settings.arguments as Lease;

    void uploadToFirebase() async {
      justonce = 1;
      await uploadFile(lease.signature1!, 1);
      print(url);
      lease.sigurl1 = url;
      if (lease.signature2 != null) {
        await uploadFile(lease.signature2, 2);
        lease.sigurl2 = url;
        print(url);
      }
      FirestoreService.sendToFirestore(lease);
    }

    if (justonce == 0) uploadToFirebase();

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              FontAwesomeIcons.solidPaperPlane,
              size: 120,
              color: Color(0xffc93033),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'CURRENTLY UPLOADING',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(
              height: 50,
            ),
            buildProgress(),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                child: const Text('Done'),
                onPressed: () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/', (route) => false);
                }),
          ],
        ),
      ),
    );
  }

  Widget buildProgress() => StreamBuilder<TaskSnapshot>(
      stream: uploadTask?.snapshotEvents,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data!;
          double progress = data.bytesTransferred / data.totalBytes;
          return SizedBox(
            height: 50,
            child: Stack(
              children: [
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Color(0xffeae0d6),
                  color: Color(0xffc93033),
                ),
                Center(
                  child: Text(
                    '${(100 * progress).roundToDouble()}%',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                )
              ],
            ),
          );
        } else {
          return const SizedBox(height: 50);
        }
      });
}
