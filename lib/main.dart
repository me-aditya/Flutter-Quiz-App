import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(Quizzler());
}

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.grey[900],
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: QuizApp(),
            ),
          )),
    );
  }
}

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

List<Icon> scoreKeeper = [];

class _QuizAppState extends State<QuizApp> {
  List<String> questions = [
    'Kota will reopen',
    'Today is Sunday',
    'Tom is hero',
  ];

  List<bool> answers = [
    false,
    false,
    true,
  ];

  int queNumber = 0;
  int len = 3;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                questions[queNumber % len],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          //flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.green,
              textColor: Colors.white,
              child: Text(
                "True",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                bool correctAns = answers[queNumber % len];
                if (correctAns == true) {
                  setState(() {
                    queNumber++;
                    scoreKeeper.add(
                      Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                    );
                  });
                } else {
                  setState(() {
                    queNumber++;
                    scoreKeeper.add(
                      Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    );
                  });
                }
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                bool correctAns = answers[queNumber % len];
                if (correctAns == false) {
                  setState(() {
                    queNumber++;
                    scoreKeeper.add(
                      Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                    );
                  });
                } else {
                  setState(() {
                    queNumber++;
                    scoreKeeper.add(
                      Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    );
                  });
                }
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
