import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasto/controller/requestController.dart';
import 'package:wasto/utils/colorConstant.dart';
import 'package:wasto/view/Analysis/analysisGraph.dart';
import 'package:wasto/view/collectionReport/collectionReport.dart';
import 'package:wasto/view/loginPage.dart';
import 'package:wasto/view/requestScreen/requestViewPage.dart';
import 'package:wasto/view/settingsPage/settingPage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  final List<String> items = List<String>.generate(10, (i) => '$i');
  CollectionReference customerRequests =
      FirebaseFirestore.instance.collection('Users');
  RequestController requestController = RequestController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.white,
                      foregroundImage: AssetImage("assets/images/admin.png"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Admin",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                )),
            ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CollectionReport(),
                ));
              },
              title: Row(
                children: [
                  Container(
                      height: 25,
                      width: 25,
                      child: Image.asset("assets/images/history.png")),
                  SizedBox(
                    width: 15,
                  ), // plus image
                  Text(
                    "Collection Report",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )
                ],
              ),
            ),
            ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AnalysisPage(),
                  ));
                },
                title: Row(
                  children: [
                    Container(
                        height: 25,
                        width: 25,
                        child: Image.asset("assets/images/analysis.png")),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Analysis",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    )
                  ],
                )),
            ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SettingsPage(),
                      ));
                },
                title: Row(
                  children: [
                    Container(
                        height: 25,
                        width: 25,
                        child: Image.asset("assets/images/settings.png")),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Settings",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    )
                  ],
                )),
            ListTile(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: Text(
                              "Exit Information",
                            ),
                            content: Text(
                              "Do you want to exit?",
                            ),
                            actions: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  OutlinedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "No",
                                      )),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  OutlinedButton(
                                      onPressed: () async {
                                        final SharedPreferences pref =
                                            await SharedPreferences
                                                .getInstance();
                                        await pref.setBool("isLogged", false);
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginScreen(),
                                            ));
                                      },
                                      child: Text(
                                        "Yes",
                                      )),
                                  SizedBox(
                                    width: 10,
                                  ),
                                ],
                              )
                            ],
                          ));
                },
                title: Row(
                  children: [
                    Container(
                        height: 25,
                        width: 25,
                        child: Image.asset("assets/images/logout.png")),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Logout",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    )
                  ],
                )),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("WastO"),
        backgroundColor: ColorConstant.green,
        titleTextStyle: TextStyle(
          color: ColorConstant.white,
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: StreamBuilder(
            stream: customerRequests.snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.separated(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot requests = snapshot.data!.docs[index];
                    return ListTile(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 2, color: Colors.green),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      leading: CircleAvatar(
                        backgroundColor: const Color(0xff6ae792),
                        child: Text(
                          items[index + 1],
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                      title: Text(
                        "${requests['Name']}",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      subtitle: Text(
                        "${requests['Quantity']}",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      trailing: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RequestViewPage(
                                    name: requests['Name'],
                                    mobileNumber: requests['Phone'],
                                    wasteType: requests['Type'],
                                    location: requests['Address'],
                                    quantity: requests['Quantity'],
                                    date: requests['Date'],
                                  ),
                                ));
                            requestController.deleteData(id: requests.id);
                            setState(() {});
                          },
                          icon: Icon(Icons.arrow_forward)),
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
          )),
    );
  }
}
