import 'dart:math';

class Question {
  final int firstOperand;
  final int secondOperand;
  final String operator;
  final double correctAnswer;

  Question({
    required this.firstOperand,
    required this.secondOperand,
    required this.operator,
    required this.correctAnswer,
  });


  factory Question.generateRandomQuestion() {
    final random = Random();
    final operators = ['+', '-', '*', '/'];
    int firstOperand = random.nextInt(100) + 1;
    int secondOperand = random.nextInt(100) + 1;
    String operator = operators[random.nextInt(4)];

    double correctAnswer;
    switch (operator) {
      case '+':
        correctAnswer = firstOperand + secondOperand.toDouble();
        break;
      case '-':
        correctAnswer = firstOperand - secondOperand.toDouble();
        break;
      case '*':
        correctAnswer = firstOperand * secondOperand.toDouble();
        break;
      case '/':
        correctAnswer = firstOperand / secondOperand.toDouble();
        break;
      default:
        correctAnswer = 0;
    }

    return Question(
      firstOperand: firstOperand,
      secondOperand: secondOperand,
      operator: operator,
      correctAnswer: correctAnswer,
    );
  }
}
