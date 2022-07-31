import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final questions = const [
    {
      'questionText': 'What is your favorite color?',
      'answers': [
        {'text':'Black','score':10},
        {'text':'Green','score':5},
        {'text':'Blue','score':2},
      ]
    },
    {
      'questionText': 'What is your favorite animal?',
      'answers': [
        {'text':'Rabbit','score':5},
        {'text':'Snake','score':2},
        {'text':'Lion','score':7},
      ]
    },
    {
      'questionText': 'What is your favorite language?',
      'answers': [
        {'text':'PHP','score':3},
        {'text':'C','score':2},
        {'text':'Rust','score':15},
      ]
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
      _questionIndex += 1;
    });

    if (_questionIndex < questions.length) {
      print('We have more questions');
    } else {
      print('No more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Test App'),
        ),
        body: _questionIndex < questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: questions,
              )
            : Result(_totalScore,_resetQuiz),
      ),
    );
  }
}
