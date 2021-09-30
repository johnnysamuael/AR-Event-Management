import 'package:arvent/authentication/splash/splash_screen.dart';
import 'package:arvent/constants.dart';
import 'package:arvent/eventScreen/event_screen.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
  MainScreen({this.body});
  final body;
  static String id = "mainScreen";

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _auth = FirebaseAuth.instance;
  var loggedInUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: ListView(
            children: [
              SizedBox(
                height: 30.0,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hello,",
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "Explorer",
                            style: TextStyle(
                                fontSize: 30.0, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () async {
                          SharedPreferences pref =
                              await SharedPreferences.getInstance();
                          pref.remove("email");
                          Navigator.popAndPushNamed(context, SplashScreen.id);
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 18.0,
                          child: Icon(
                            Icons.power_settings_new_rounded,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade500,
                      ),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: TextField(
                            onChanged: (value) {},
                            autofocus: false,
                            obscureText: false,
                            cursorColor: orange,
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.blue.shade900,
                                fontSize: 15.0),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              hintText: "Search Events",
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontSize: 15.0,
                                  decoration: TextDecoration.none),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 5.0),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Icon(
                          Icons.search_rounded,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: List.generate(
                    10,
                    (index) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EventScreen(
                                            body: widget.body,
                                            index: index,
                                          )));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey.shade500,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0)),
                              height: 330.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10.0),
                                            topRight: Radius.circular(10.0)),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                widget.body[index]["Image"]))),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: Container(
                                      height: 120.0,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            widget.body[index]["Name "],
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20.0),
                                          ),
                                          Text(
                                            widget.body[index]["Host"],
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 17.0),
                                          ),
                                          Container(
                                              decoration: BoxDecoration(
                                                color: Colors.green,
                                                borderRadius:
                                                    BorderRadius.circular(32.0),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5.0,
                                                        horizontal: 10.0),
                                                child: Text(
                                                  "Rs.350",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 10.0),
                                                ),
                                              )),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
