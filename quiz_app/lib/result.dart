import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  Result({Key key, @required this.score, this.restart}) : super(key: key);

  final double score;
  final Function restart;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: Text(
            'Your score is $score',
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
        ),
        FlatButton(
          child: Text("Restart Quiz"),
          onPressed: restart,
          textColor: Colors.blue,
        )
      ],
    );
  }
}
