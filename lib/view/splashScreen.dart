import 'dart:async';
import 'package:flutter/material.dart';
import 'package:wasto/utils/colorConstant.dart';
import 'package:wasto/utils/imageConstant.dart';
import 'package:wasto/view/loginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasto/utils/widgets/bottomNavigationBar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2)).then((value) async {
      final SharedPreferences pref = await SharedPreferences.getInstance();
      final isLogged = await pref.getBool("isLogged");
      print(isLogged);
      if (isLogged == true) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => BottomNavigation()),
        );
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ));
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: SizedBox(
              child: Text(
                "Wasto",
                style: TextStyle(
                  color: ColorConstant.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
          ),
          Container(
            height: 300,
            width: 300,
            child: Image.asset(ImageConstant.splashlogo),
          ),
        ],
      ),
    );
  }
}
