import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  final questions = ["What's your favorite color?", "What's PI's value?"];

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
          title: Text("My App Bar"),
        ),
        body: Column(
          children: <Widget>[
            Text(questions[_questionIndex]),
            RaisedButton(
              child: Text("Answer 1"),
              onPressed: handlePress,
            ),
            RaisedButton(
              child: Text("Answer 2"),
              onPressed: handlePress,
            ),
            RaisedButton(
              child: Text("Answer 3"),
              onPressed: handlePress,
            )
          ],
        ),
      ),
    );
  }
}
