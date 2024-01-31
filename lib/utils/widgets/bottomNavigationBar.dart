import 'package:flutter/material.dart';
import 'package:wasto/view/settingsPage/aboutPage.dart';
import 'package:wasto/view/termsAndConditions/termsAndCondtions.dart';
import 'package:wasto/view/homeScreen/homeScreen.dart';
import 'package:wasto/view/transportation/transportationDetails.dart';
import 'package:wasto/view/wasteMaster/wasteMasterDetails.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int selectedIndex = 0;
  List<Widget> myWidgetList = [
    HomeScreen(),
    WasteMasterDetails(),
    TransportationDetails(),
    AboutScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myWidgetList[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          backgroundColor: Colors.green,
          currentIndex: selectedIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.report),
                label: "Requests"), //shown all requests
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: "Wastemaster"), //wastemaster
            BottomNavigationBarItem(
                icon: Icon(Icons.bus_alert_rounded),
                label: "Transportation"), //transportation
            BottomNavigationBarItem(
                icon: Icon(Icons.help),
                label: "About Us"), //terms and conditions
          ]),
    );
  }
}
