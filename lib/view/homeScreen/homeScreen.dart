import 'package:flutter/material.dart';
import 'package:wasto/utils/colorConstant.dart';
import 'package:wasto/utils/imageConstant.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("WastO"),
        backgroundColor: ColorConstant.green,
        titleTextStyle: TextStyle(
          color: ColorConstant.white,
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.logout))],
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
