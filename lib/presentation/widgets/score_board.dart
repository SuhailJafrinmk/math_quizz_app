import 'package:flutter/material.dart';

class ScoreboardDialog extends StatelessWidget {
  final int correctAnswers;
  final int wrongAnswers;
  final int score; // Accept score through the constructor

  const ScoreboardDialog({
    Key? key,
    required this.correctAnswers,
    required this.wrongAnswers,
    required this.score, // Constructor parameter for score
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Quiz Scoreboard'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Quiz Score',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          _buildScoreCard('Correct Answers', correctAnswers, Colors.green),
          const SizedBox(height: 10),
          _buildScoreCard('Wrong Answers', wrongAnswers, Colors.red),
          const SizedBox(height: 20),
          _buildScoreCard('Total Score', score, Colors.blue), // Display score passed in
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Dismiss the dialog
          },
          child: const Text('Close'),
        ),
      ],
    );
  }

  Widget _buildScoreCard(String title, int count, Color color) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '$count',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void showScoreboardDialog(BuildContext context, int correctAnswers, int wrongAnswers, int score) {
  showDialog(
    context: context,
    barrierDismissible: true, // Dialog can be dismissed by tapping outside
    builder: (BuildContext context) {
      return ScoreboardDialog(
        correctAnswers: correctAnswers,
        wrongAnswers: wrongAnswers,
        score: score, // Pass the score to the dialog
      );
    },
  );
}



