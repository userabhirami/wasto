import 'package:flutter/material.dart';
import 'package:wasto/utils/colorConstant.dart';

class CollectionReport extends StatelessWidget {
  const CollectionReport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Tab(
              text: "Pendings",
            ),
          ],
        ),
      ),
      body: TabBarView(
        children: [
          Center(child: Text("all requests")), //AllReqScreen()
          Center(child: Text("accepted requests")), //AcceptReqScreen()
          Center(child: Text("rejected requests")), //RejectReqScreen()
          Center(child: Text("pending requests")), //pendingReqScreen()
        ],
      ),
    );
  }
}
