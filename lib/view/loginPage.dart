import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
                validator: MultiValidator([
                  RequiredValidator(errorText: "* Required"),
                  EmailValidator(errorText: "Enter valid email id"),
                ]),
                controller: emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  //labelText: "Email",
                  hintText: "Enter your email",
                  prefixIcon: Icon(color: ColorConstant.green, Icons.email),
                ),
              ),
              TextFormField(
                validator: MultiValidator([
                  RequiredValidator(errorText: "* Required"),
                  MinLengthValidator(6,
                      errorText: "Password should be atleast 6 characters"),
                  MaxLengthValidator(15,
                      errorText:
                          "Password should not be greater than 15 characters")
                ]),
                //validatePassword,
                obscureText: true,
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
                    final SharedPreferences pref =
                        await SharedPreferences.getInstance();
                    final String email = pref.getString("email").toString();

                    print(email);
                    final String pass = pref.getString("password").toString();

                    print(pass);

                    if (emailAddress.text.trim() == email &&
                        password.text.trim() == pass) {
                      await pref.setBool("isLogged", true);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor:
                              const Color.fromARGB(255, 236, 89, 78),
                          content: Text("Enter a valid username and password!"),
                        ),
                      );
                    }
                    /*  try {
                      final credential = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: emailAddress.text,
                              password: password.text);
                      print(credential.user?.uid);
                      if (emailAddress.text.isNotEmpty &&
                          password.text.isNotEmpty) {
                        if (credential.user?.uid != null) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ));
                        }
                      }
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        // print('No user found for that email.');
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: ColorConstant.green,
                            content: Text(
                              "No user found for that email.",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                        );
                      } else if (e.code == 'wrong-password') {
                        // print('Wrong password provided for that user.');
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: ColorConstant.green,
                            content: Text(
                              "Wrong password provided for that user.",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                        );
                      }
                    }

                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        )); */
                  },
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  )),
              /* SizedBox(
                child: Text(
                  "Forgot password?",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: ColorConstant.green),
                ),
              ), */
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
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
