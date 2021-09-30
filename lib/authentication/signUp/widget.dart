import 'package:flutter/material.dart';
import 'package:arvent/constants.dart';

class RoundButton extends StatelessWidget {
  RoundButton({this.title, this.colour, @required this.onPressed});

  final Color colour;
  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(16.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            title,
            style: TextStyle(fontSize: 20.0, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class RoundEntryEmail extends StatelessWidget {
  RoundEntryEmail({this.title, this.colour, @required this.onChanged});
  final String title;
  final Color colour;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      textAlign: TextAlign.center,
      cursorColor: orange,
      style: TextStyle(color: Colors.blue),
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: title,
        hintStyle: TextStyle(color: Colors.grey),
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colour, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colour, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
      ),
    );
  }
}

class RoundEntryPassword extends StatelessWidget {
  RoundEntryPassword({this.title, this.colour, @required this.onChanged});
  final String title;
  final Color colour;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: true,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.blue),
      onChanged: onChanged,
      cursorColor: orange,
      decoration: InputDecoration(
        hintText: title,
        hintStyle: TextStyle(color: Colors.grey),
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colour, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colour, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
      ),
    );
  }
}
