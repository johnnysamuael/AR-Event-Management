import 'package:arvent/eventScreen/payments_screen.dart';
import 'package:flutter/material.dart';
import 'package:arvent/constants.dart';
import 'package:video_player_360/video_player_360.dart';

class EventScreen extends StatefulWidget {
  EventScreen({this.body, this.index});
  final body;
  final index;
  static String id = "event_screen";
  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  int ticketNum = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              height: 300.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "${widget.body[widget.index]["Image"]}"))),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              child: Text(
                "${widget.body[widget.index]["Name "]}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              child: Text(
                "${widget.body[widget.index]["Host"]}",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              child: Text(
                "${widget.body[widget.index]["Description "]}",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15.0),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 10.0),
                        child: Text(
                          "Rs.350",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 15.0),
                        ),
                      )),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () async {
                      await VideoPlayer360.playVideoURL(
                          "https://github.com/stephangopaul/video_samples/blob/master/gb.mp4?raw=true");
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xFF7750FA),
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 15.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.high_quality,
                              color: Colors.white,
                              size: 25.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                "Virtual Reality Experience (Beta)",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.0,
                                    color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, left: 15.0, bottom: 2.0),
                  child: Text(
                    "No. of tickets",
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (ticketNum > 1) {
                                ticketNum--;
                              }
                            });
                          },
                          child: CircleAvatar(
                            backgroundColor: orange,
                            radius: 15.0,
                            child: Center(
                                child: Icon(
                              Icons.arrow_left,
                              color: Colors.white,
                            )),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Container(
                          height: 22.0,
                          width: 22.0,
                          child: Center(
                              child: Text(
                            "$ticketNum",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2.0),
                              border: Border.all(color: orange)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (ticketNum < 10) {
                                ticketNum++;
                              }
                            });
                          },
                          child: CircleAvatar(
                            backgroundColor: orange,
                            radius: 15.0,
                            child: Center(
                              child: Icon(
                                Icons.arrow_right,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 15.0),
              child: Material(
                elevation: 5.0,
                color: orange,
                borderRadius: BorderRadius.circular(16.0),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, PaymentScreen.id);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    "Book Now",
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
