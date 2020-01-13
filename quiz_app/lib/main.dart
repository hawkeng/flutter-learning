import 'package:flutter/material.dart';

import './quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  static const _questions = [
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
        body: _questionIndex < _questions.length
            ? Quiz(
                questionData: _questions[_questionIndex],
                onPressed: handlePress,
              )
            : Center(
                child: Text("You are done!"),
              ),
      ),
    );
  }
}
