import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wasto/utils/colorConstant.dart';
import 'package:wasto/view/loginPage.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var passwordVisible = false;
  TextEditingController emailAddress = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
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
                  "Create your account",
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
                    // labelText: "Email",
                    hintText: "Enter your email",
                    prefixIcon: Icon(color: ColorConstant.green, Icons.email),
                  )),
              TextFormField(
                controller: password,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    // labelText: "Password",
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
                    //createUserWithEmailAndPassword
                    print(emailAddress.text);
                    print(password.text);
                    try {
                      final credential = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: emailAddress.text,
                        password: password.text,
                      );
                      print(credential.user?.uid);
                      if (credential.user?.uid != null) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ));
                      }
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        print('The password provided is too weak.');
                      } else if (e.code == 'email-already-in-use') {
                        print('The account already exists for that email.');
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: Text("Sign Up")),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ));
                },
                child: SizedBox(
                  child: Text(
                    "Already have an account? Sign In",
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
