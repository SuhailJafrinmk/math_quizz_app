import 'package:flutter/material.dart';
import 'package:math_quizz_app/resources/constants/app_strings.dart';

void showCorrectAnswerDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(AppStrings.correctAnswer),
        content: Text('Congratulations! You submitted the right answer.'),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop(); 
            },
          ),
        ],
      );
    },
  );
}
