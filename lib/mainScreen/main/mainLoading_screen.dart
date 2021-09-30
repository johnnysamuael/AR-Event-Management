import 'package:arvent/mainScreen/main/mainScreen.dart';
import 'package:flutter/material.dart';
import 'package:arvent/constants.dart';
import 'dart:convert';

class MainLoadingScreen extends StatefulWidget {
  static String id = "mainLoading_screen";
  @override
  _MainLoadingScreenState createState() => _MainLoadingScreenState();
}

class _MainLoadingScreenState extends State<MainLoadingScreen> {
  var body;
  bool isLoading = true;
  getJsonData() async {
    final assetBundle = DefaultAssetBundle.of(context);
    final data = await assetBundle.loadString("assets/events.json");
    body = json.decode(data);
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => MainScreen(
                  body: body,
                )));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: orange,
      ),
    );
  }
}
