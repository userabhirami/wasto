import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasto/utils/colorConstant.dart';
import 'package:wasto/view/registrationPage.dart';
import 'package:wasto/view/settingsPage/aboutPage.dart';
import 'package:wasto/view/settingsPage/resetPassword.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: ColorConstant.green,
        titleTextStyle: TextStyle(
          color: ColorConstant.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          SizedBox(
            height: 15,
          ),
          // Text(
          //   "Theme",
          //   style: TextStyle(fontSize: 16, color: Colors.black),
          // ),
          // SizedBox(
          //   height: 10,
          // ),
          // Text(
          //   "Language",
          //   style: TextStyle(fontSize: 16, color: Colors.black),
          // ),
          // SizedBox(
          //   height: 10,
          // ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AboutScreen(),
                  ));
            },
            child: Text(
              "About Us",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResetPassword(),
                  ));
            },
            child: Text(
              "Reset your Password",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () async {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: Text(
                          "Are you want to delete this account",
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
                                    SharedPreferences preferences =
                                        await SharedPreferences.getInstance();
                                    await preferences.clear();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: const Color.fromARGB(
                                            255, 236, 89, 78),
                                        content: Text(
                                            "Your Account Deleted, Register Again"),
                                      ),
                                    );

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              RegisterScreen(),
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
            child: Text(
              "Delete your Account",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
