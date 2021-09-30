import 'package:arvent/authentication/logIn/logIn_screen.dart';
import 'package:arvent/authentication/signUp/signUp_screen.dart';
import 'package:flutter/material.dart';
import 'package:arvent/constants.dart';
import 'widget.dart';

class SplashScreen extends StatelessWidget {
  static String id = "splash_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    height: 350,
                    child: Image.asset("images/pic2.png"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          "AR",
                          style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          "Vent",
                          style: TextStyle(
                            color: orange,
                            fontSize: 40.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: Divider(
                      thickness: 1.0,
                      color: orange,
                    ),
                  ),
                  SizedBox(
                    height: 22.0,
                  ),
                  //Semi Custom Round Button : Code present in resources
                  RoundButton(
                    title: 'Login',
                    colour: orange,
                    onPressed: () {
                      Navigator.pushNamed(context, LogInScreen.id);
                    },
                  ),
                  //Semi Custom Round Button : Code present in resources
                  RoundButton(
                    title: 'SignUp',
                    colour: Colors.blue,
                    onPressed: () {
                      Navigator.pushNamed(context, SignUpScreen.id);
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
