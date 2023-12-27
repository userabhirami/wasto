import 'package:cloud_firestore/cloud_firestore.dart';

class RequestController {
  CollectionReference responseCollection =
      FirebaseFirestore.instance.collection('ResponseNotification');

  Future addData(
      {required String cusname,
      required String cusmob,
      required String location,
      required String quantity,
      required String wastetype,
      required String masname,
      required String masmob,
      required String date,
      required String time}) async {
    responseCollection.add({
      "customerName": cusname,
      "customerMobile": cusmob,
      "location": location,
      "quantity": quantity,
      "wasteType": wastetype,
      "masterName": masname,
      "masterMobile": masmob,
      "date": date,
      "time": time
    });
  }
}
