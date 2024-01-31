import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasto/utils/colorConstant.dart';
import 'package:wasto/view/loginPage.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController currentPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reset your Password"),
        backgroundColor: ColorConstant.green,
        titleTextStyle: TextStyle(
          color: ColorConstant.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          SizedBox(
            height: 20,
          ),
          TextFormField(
              controller: currentPassword,
              keyboardType: TextInputType.visiblePassword,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Current Password",
              )),
          SizedBox(
            height: 20,
          ),
          TextFormField(
              controller: newPassword,
              keyboardType: TextInputType.visiblePassword,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter New Password",
              )),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: ColorConstant.white),
              ),
              onPressed: () async {
                final SharedPreferences pref =
                    await SharedPreferences.getInstance();
                if (currentPassword.text.trim().isNotEmpty &&
                    newPassword.text.trim().isNotEmpty) {
                  await pref.setString("password", newPassword.text.trim());
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: const Color.fromARGB(255, 236, 89, 78),
                      content:
                          Text("Your password changed, Please login again..."),
                    ),
                  );
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: const Color.fromARGB(255, 236, 89, 78),
                      content: Text("Enter Password"),
                    ),
                  );
                }
              },
              child: Text("Change Password")),
          SizedBox(
            height: 10,
          ),
        ]),
      ),
    );
  }
}
