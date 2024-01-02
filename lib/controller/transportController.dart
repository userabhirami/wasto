import 'package:cloud_firestore/cloud_firestore.dart';

class TransportController {
  CollectionReference vehicleCollection =
      FirebaseFirestore.instance.collection('vehicles');
  Future addvehicle({
    required String mobile,
    required String number,
    required String drivername,
    //  required String status,
  }) async {
    vehicleCollection.add({
      "vehicleNumber": number,
      "driverName": drivername,
      "driverMobile": mobile,
      //  "status": status,
    });
  }
}
