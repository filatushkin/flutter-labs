import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final VoidCallback resetQuiz;

  // ignore: use_key_in_widget_constructors
  const Result(this.score,this.resetQuiz);

  String get resultPhrase {
    String resultText = 'You did it';
    if(score <= 8){
      resultText = 'You have less 8';
    }else if(score <= 12){
      resultText = 'You have less 12';
    }else if(score <= 16){
      resultText = 'You have less 16';
    }else{
      resultText = 'Oh no...';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          FlatButton(onPressed: resetQuiz, child: Text('Restart'),)
        ],
      ),
    );
  }
}
