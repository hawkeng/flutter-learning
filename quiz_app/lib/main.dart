import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _answers = [];
  static const _questions = [
    {
      'text': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Cyan', 'score': 10},
        {'text': 'Navy', 'score': 10},
        {'text': 'Turquoise', 'score': 5},
      ],
    },
    {
      'text': 'What\'s PI\'s value?',
      'answers': [
        {'text': '3.1416', 'score': 10},
        {'text': '42', 'score': 20},
        {'text': '11', 'score': 0},
      ],
    },
  ];

  void handlePress(Map selectedAnswer) {
    setState(() {
      _answers.add(selectedAnswer);
      _questionIndex++;
    });
  }

  void restartQuiz() {
    setState(() {
      _questionIndex = 0;
      _answers.clear();
    });
  }

  double getScore() {
    return _answers.fold(0, (acc, answer) => acc + answer['score']);
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
            : Result(
                score: getScore(),
                restart: restartQuiz,
              ),
      ),
    );
  }
}
