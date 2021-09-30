import 'package:arvent/mainScreen/main/mainLoading_screen.dart';
import 'package:arvent/mainScreen/main/mainScreen.dart';
import 'package:flutter/material.dart';
import 'package:arvent/constants.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogInScreen extends StatefulWidget {
  static String id = "logIn_screen";
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool loadingSpinner = false;
  String email;
  String password;
  final _auth = FirebaseAuth.instance;
  bool error = false;
  storeemail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("email", email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: ModalProgressHUD(
        inAsyncCall: loadingSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "AR",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 40.0,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Play"),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Vent",
                      style: TextStyle(
                          color: orange,
                          fontSize: 40.0,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Play"),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 48.0,
              ),
              RoundEntryEmail(
                title: 'Enter your email',
                colour: Colors.blue,
                onChanged: (value) {
                  email = value;
                },
              ),
              SizedBox(
                height: 8.0,
              ),
              RoundEntryPassword(
                title: 'Enter your password',
                colour: Colors.blue,
                onChanged: (value) {
                  password = value;
                },
              ),
              SizedBox(
                height: 15.0,
              ),
              if (error == true)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Invalid Credentials or Network Issue",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              SizedBox(
                height: 24.0,
              ),
              RoundButton(
                  title: 'Log In',
                  colour: orange,
                  onPressed: () async {
                    setState(() {
                      loadingSpinner = true;
                    });
                    try {
                      final user = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      if (user != null) {
                        setState(() {
                          error = false;
                        });
                        storeemail();
                        Navigator.pushReplacementNamed(
                            context, MainLoadingScreen.id);
                      }
                      setState(() {
                        loadingSpinner = false;
                      });
                    } catch (e) {
                      setState(() {
                        error = true;
                        loadingSpinner = false;
                      });
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
