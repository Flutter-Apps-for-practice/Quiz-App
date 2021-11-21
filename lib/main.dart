import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questions const = [
      {
      'questionText': 'What is this operation \'||\'?',
      'answers': [
        {'text': 'OR', 'score': 1},
        {'text': 'AND', 'score': 0},
        {'text': 'NOR', 'score': 0},
        {'text': 'NAND', 'score': 0},
      ],
    },
    {
      'questionText': 'What language we are using?',
      'answers': [
        {'text': 'Flutter', 'score': 0},
        {'text': 'Swift', 'score': 0},
        {'text': 'Dart', 'score': 1},
        {'text': 'No right answer', 'score': 0},
      ],
    },
    {
      'questionText': 'Which one is right?',
      'answers': [
        {'text': '1>=0', 'score': 1},
        {'text': '2>5', 'score': 0},
        {'text': '7<=3', 'score': 0},
        {'text': '6!=6', 'score': 0},
    ],
    },
    ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {

    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    // var dummy = const ['Hello'];
    // dummy.add('Max');
    // print(dummy);
    // dummy = [];
    // questions = []; // does not work if questions is a const

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
