import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wasto/utils/colorConstant.dart';
import 'package:wasto/view/homeScreen/homeScreen.dart';
import 'package:wasto/view/registrationPage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var passwordVisible = false;
  TextEditingController emailAddress = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 50,
              ),
              SizedBox(
                child: Text(
                  "Sign In",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: ColorConstant.green),
                ),
              ),
              TextFormField(
                controller: emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  //labelText: "Email",
                  hintText: "Enter your email",
                  prefixIcon: Icon(color: ColorConstant.green, Icons.email),
                ),
              ),
              TextFormField(
                controller: password,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    //  labelText: "Password",
                    hintText: "Enter your password",
                    prefixIcon: Icon(color: ColorConstant.green, Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {});
                        passwordVisible = !passwordVisible;
                      },
                      icon: Icon(passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                    )),
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
                    try {
                      final credential = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: emailAddress.text,
                              password: password.text);
                      print(credential.user?.uid);
                      if (credential.user?.uid != null) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ));
                      }
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        print('No user found for that email.');
                      } else if (e.code == 'wrong-password') {
                        print('Wrong password provided for that user.');
                      }
                    }

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ));
                  },
                  child: Text("Sign In")),
              SizedBox(
                child: Text(
                  "Forgot password?",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: ColorConstant.green),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterScreen(),
                      ));
                },
                child: SizedBox(
                  child: Text(
                    "Not a member? Sign up now",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: ColorConstant.green),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
            ]),
      ),
    );
  }
}
