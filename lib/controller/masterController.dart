import 'package:cloud_firestore/cloud_firestore.dart';

class MasterController {
  CollectionReference masterCollection =
      FirebaseFirestore.instance.collection('wasteMaster');
  Future addwasteMaster({
    required String name,
    required String mob,
    required String place,
    required String date1,
  }) async {
    masterCollection.add({
      "masterName": name,
      "masterMobile": mob,
      "joiningDate": date1,
      "place": place,
    });
  }
}
