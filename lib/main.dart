import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wasto/view/homeScreen/homeScreen.dart';
import 'package:wasto/view/registrationPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyADy3y87E1-7FZJ67gKaswu16s35bSwqKw",
          appId: "1:790435103389:android:31aa9f70ea4f71db0f8a74",
          messagingSenderId: "",
          projectId: "wasto-4d315",
          storageBucket: "wasto-4d315.appspot.com"));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return HomeScreen();
            } else {
              return RegisterScreen();
            }
          },
        ));
  }
}
