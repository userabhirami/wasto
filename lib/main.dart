import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wasto/utils/widgets/bottomNavigationBar.dart';
import 'package:wasto/view/splashScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDfesUtkCvO8jIrxvTNYGpXZgnQP6lnmpM",
          appId: "1:225802149768:android:cadd88fe2d2e39b778243d",
          messagingSenderId: "",
          projectId: "project-firebase-8fbd3",
          storageBucket: "project-firebase-8fbd3.appspot.com"));
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
              return BottomNavigation();
            } else {
              return SplashScreen();
            }
          },
        ));
  }
}
