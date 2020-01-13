import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  Result({Key key, @required this.score}) : super(key: key);

  final double score;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Your score is $score',
        style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
      ),
    );
  }
}
