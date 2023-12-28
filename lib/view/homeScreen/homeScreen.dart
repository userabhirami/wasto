import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wasto/utils/colorConstant.dart';
import 'package:wasto/view/loginPage.dart';
import 'package:wasto/view/requestScreen/requestViewPage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  final List<String> items = List<String>.generate(10, (i) => '$i');
  CollectionReference customerRequests =
      FirebaseFirestore.instance.collection('customers');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
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
              title: Row(
                children: [
                  Container(
                      height: 50,
                      width: 50,
                      child: Image.asset("assets/images/history.png")),
                  SizedBox(
                    width: 10,
                  ), // plus image
                  Text(
                    "History",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )
                ],
              ),
            ),
            ListTile(
                title: Row(
              children: [
                Container(
                    height: 50,
                    width: 50,
                    child: Image.asset("assets/images/wastemaster.png")),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Waste Master",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )
              ],
            )),
            ListTile(
                title: Row(
              children: [
                Container(
                    height: 50,
                    width: 50,
                    child: Image.asset("assets/images/transportation.png")),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Transportation",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )
              ],
            )),
            ListTile(
                title: Row(
              children: [
                Container(
                    height: 50,
                    width: 50,
                    child: Image.asset("assets/images/analysis.png")),
                SizedBox(
                  width: 10,
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
                title: Row(
              children: [
                Container(
                    height: 50,
                    width: 50,
                    child: Image.asset("assets/images/reviews.png")),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Reviews",
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
                                      onPressed: () {
                                        Navigator.push(
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
                        height: 50,
                        width: 50,
                        child: Image.asset("assets/images/logout.png")),
                    SizedBox(
                      width: 10,
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
                        "${requests['location']}",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      subtitle: Text(
                        "${requests['quantity']}",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      trailing: IconButton(
                          onPressed: () {
                            /* var selectedIndex = FirebaseFirestore.instance
                                .collection('customers')
                                .doc().id;*/
                            // print("selecteed index = ${snapshot.data!.docs}");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RequestViewPage(
                                      name: requests['name'],
                                      mobileNumber: requests['mobileNumber'],
                                      wasteType: requests['wasteType'],
                                      location: requests['location'],
                                      quantity: requests['quantity']),
                                ));
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
      /* bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.green,
          currentIndex: selectedIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.history),
                label: "Request"), //shown all requests
            BottomNavigationBarItem(
                icon: Icon(Icons.search), label: "Search"), //search
            BottomNavigationBarItem(
                icon: Icon(Icons.location_on), label: "Location"), //location
            BottomNavigationBarItem(
                icon: Icon(Icons.help), label: "Help"), //help
          ]),*/
    );
  }
}
