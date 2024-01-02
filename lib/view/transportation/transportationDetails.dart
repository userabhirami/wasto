import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wasto/utils/colorConstant.dart';
import 'package:wasto/view/transportation/addTransportation.dart';

class TransportationDetails extends StatefulWidget {
  const TransportationDetails({super.key});

  @override
  State<TransportationDetails> createState() => _TransportationDetailsState();
}

class _TransportationDetailsState extends State<TransportationDetails> {
  CollectionReference customerRequests =
      FirebaseFirestore.instance.collection('vehicles');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transportation Details"),
        backgroundColor: ColorConstant.green,
        titleTextStyle: TextStyle(
          color: ColorConstant.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                child: Image.asset("assets/images/transportation.png"),
                width: 150,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: ColorConstant.black),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddTransportation(),
                        ));
                  },
                  child: Text("+ Add Vehicle"))
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: StreamBuilder(
            stream: customerRequests.snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.separated(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot requests = snapshot.data!.docs[index];
                    return Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.greenAccent,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Vehicle Number : ${requests['vehicleNumber']}",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Text(
                              "Driver Name : ${requests['driverName']}",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Text(
                              "Driver Mobile : ${requests['driverMobile']}",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 10);
                  },
                );
              } else {
                return Center(
                  child: Text(
                    "no data found",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                );
              }
            },
          ))
        ],
      ),
    );
  }
}
