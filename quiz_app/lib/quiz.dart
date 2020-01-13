import 'package:flutter/material.dart';

import './answer.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  const Quiz({
    Key key,
    @required this.questionData,
    @required this.onPressed,
  }) : super(key: key);

  final Map<String, Object> questionData;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(questionData['text']),
        ...(questionData['answers'] as List<String>).map((answer) => Answer(
              text: answer,
              onPressed: onPressed,
            )),
      ],
    );
  }
}
