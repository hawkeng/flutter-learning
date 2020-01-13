import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String text;
  final Function onPressed;

  Answer({@required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: RaisedButton(
        child: Text(text),
        onPressed: onPressed,
        color: Colors.blue,
        textColor: Colors.white,
      ),
    );
  }
}
