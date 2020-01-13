import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  static const questions = [
    {
      'text': 'What\'s your favorite color?',
      'answers': ['Cyan', 'Navy', 'Turquoise'],
    },
    {
      'text': 'What\'s PI\'s value?',
      'answers': ['3.1416', '42', '11'],
    },
  ];

  void handlePress() {
    setState(() {
      _questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My App Bar'),
        ),
        body: _questionIndex < questions.length
            ? Column(
                children: <Widget>[
                  Question(questions[_questionIndex]['text']),
                  ...(questions[_questionIndex]['answers'] as List<String>)
                      .map((answer) => Answer(
                            text: answer,
                            onPressed: handlePress,
                          )),
                ],
              )
            : Center(
                child: Text("You are done!"),
              ),
      ),
    );
  }
}
