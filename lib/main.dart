import 'package:arvent/authentication/loading/loading_screen.dart';
import 'package:arvent/authentication/logIn/logIn_screen.dart';
import 'package:arvent/authentication/signUp/signUp_screen.dart';
import 'package:arvent/authentication/splash/splash_screen.dart';
import 'package:arvent/eventScreen/event_screen.dart';
import 'package:arvent/eventScreen/payments_screen.dart';
import 'package:arvent/gettingStarted/gettingStartedScreen/gettingStarted_screen.dart';
import 'package:arvent/mainScreen/main/mainLoading_screen.dart';
import 'package:arvent/mainScreen/main/mainScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoadingScreen.id,
      routes: {
        GettingStartedScreen.id: (context) => GettingStartedScreen(),
        SplashScreen.id: (context) => SplashScreen(),
        SignUpScreen.id: (context) => SignUpScreen(),
        LogInScreen.id: (context) => LogInScreen(),
        MainScreen.id: (context) => MainScreen(),
        LoadingScreen.id: (context) => LoadingScreen(),
        MainLoadingScreen.id: (context) => MainLoadingScreen(),
        EventScreen.id: (context) => EventScreen(),
        PaymentScreen.id: (context) => PaymentScreen(),
      },
    );
  }
}
