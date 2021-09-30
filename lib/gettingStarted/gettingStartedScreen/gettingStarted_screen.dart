import 'package:arvent/authentication/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:arvent/constants.dart';

class GettingStartedScreen extends StatefulWidget {
  static String id = "gettingStarted_screen";

  @override
  _GettingStartedScreenState createState() => _GettingStartedScreenState();
}

class _GettingStartedScreenState extends State<GettingStartedScreen> {
  var duration = Duration(milliseconds: 500);

  final PageController controller = PageController(initialPage: 0);

  Curve swipe = Curves.ease;

  int page = 0;

  List<bool> color = [true, false, false, false];

  int dotIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, SplashScreen.id);
                  },
                  child: Text(
                    "Skip",
                    style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                  ),
                )),
          ),
          Container(
            height: 400,
            child: PageView(
              controller: controller,
              onPageChanged: (value) {
                setState(() {
                  page = value;
                  for (int i = 0; i < 4; i++) {
                    if (i <= page) {
                      color[i] = true;
                    } else {
                      color[i] = false;
                    }
                  }
                });
              },
              scrollDirection: Axis.horizontal,
              children: [
                Column(
                  children: [
                    Container(
                      height: 300,
                      width: 300,
                      child: Image.asset("images/pic1.png"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            "AR",
                            style: TextStyle(
                                color: orange,
                                fontWeight: FontWeight.bold,
                                fontSize: 30.0),
                          ),
                        ),
                        Center(
                          child: Text(
                            "Vent",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 30.0),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 300,
                      width: 300,
                      child: Image.asset("images/pic2.png"),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Text(
                          "Experience events in AR like never before",
                          style: TextStyle(
                              color: orange,
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 300,
                      width: 300,
                      child: Image.asset("images/pic3.png"),
                    ),
                    Center(
                      child: Text(
                        "Find event you love",
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 300,
                      width: 300,
                      child: Image.asset("images/pic4.png"),
                    ),
                    Center(
                      child: Text(
                        "Host your own event",
                        style: TextStyle(
                            color: orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                4,
                (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: color[index]
                                ? Colors.blue
                                : Colors.grey.shade600,
                            borderRadius: BorderRadius.circular(16.0)),
                        height: 5.0,
                        width: 10.0,
                      ),
                    )),
          ),
          RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0)),
              color: orange,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 70.0),
                child: Text(
                  "Next",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0),
                ),
              ),
              onPressed: () {
                if (page == 3) {
                  Navigator.pushReplacementNamed(context, SplashScreen.id);
                }
                controller.nextPage(duration: duration, curve: swipe);
                setState(() {
                  for (int i = 0; i < 4; i++) {
                    if (i <= page) {
                      color[i] = true;
                    } else {
                      color[i] = false;
                    }
                  }
                });
              })
        ],
      ),
    );
  }
}
