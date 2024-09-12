import 'package:flutter/material.dart';
import 'package:math_quizz_app/resources/constants/app_strings.dart';

class ScoreboardDialog extends StatelessWidget {
  final int correctAnswers;
  final int wrongAnswers;
  final int score;

  const ScoreboardDialog({
    Key? key,
    required this.correctAnswers,
    required this.wrongAnswers,
    required this.score,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme=Theme.of(context).textTheme;
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppStrings.kingsLetter), 
                fit: BoxFit.fill, 
              ),
            ),
            height: 400, 
            padding: const EdgeInsets.all(50),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                  'Scoreboard',
                  style: theme.displayLarge?.copyWith(color: Color(0xFF4E3629)),
                ),
                const SizedBox(height: 40),

                Text(
                  'Correct Answers: $correctAnswers',
                  style: theme.displayMedium?.copyWith(color: Color(0xFF3C3C3C)),
                ),
                const SizedBox(height: 10),

                Text(
                  'Wrong Answers: $wrongAnswers',
                  style: theme.displayMedium?.copyWith(color: Color(0xFF5B2323)),
                ),
                const SizedBox(height: 10),

                Text(
                  'Total Score: $score',
                  style: theme.displayMedium?.copyWith(color: Colors.black),
                ),
                const SizedBox(height: 20),

                Align(
                  alignment: Alignment.bottomCenter, 
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); 
                    },
                    child:  Text(
                      'Play again',
                      style: theme.bodySmall?.copyWith(fontSize: 30,color: Color(0xFF4E3629)),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void showScoreboardDialog(BuildContext context, int correctAnswers, int wrongAnswers, int score) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return ScoreboardDialog(
        correctAnswers: correctAnswers,
        wrongAnswers: wrongAnswers,
        score: score,
      );
    },
  );
}
