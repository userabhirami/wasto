import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wasto/utils/colorConstant.dart';
import 'package:wasto/view/collectionReport/acceptedReqScreen.dart';
import 'package:wasto/view/collectionReport/allRequestScreen.dart';
import 'package:wasto/view/collectionReport/rejectReqScreen.dart';

class CollectionReport extends StatefulWidget {
  const CollectionReport({super.key});

  @override
  State<CollectionReport> createState() => _CollectionReportState();
}

class _CollectionReportState extends State<CollectionReport> {
  CollectionReference customerRequests =
      FirebaseFirestore.instance.collection('customers');
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Collection Report"),
          backgroundColor: ColorConstant.green,
          titleTextStyle: TextStyle(
            color: ColorConstant.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          bottom: TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 5,
            tabs: [
              Tab(
                text: "All Requests",
              ),
              Tab(
                text: "Accepted",
              ),
              Tab(
                text: "Rejected",
              ),
              // Tab(
              //   text: "Pendings",
              // ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            AllReqScreen(),
            AcceptReqScreen(),
            RejectReqScreen()
            // Center(child: Text("pending requests")), //pendingReqScreen()
          ],
        ),
      ),
    );
  }
}
