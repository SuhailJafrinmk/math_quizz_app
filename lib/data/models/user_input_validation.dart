class InputValidator {
  static bool isValidInput(String input) {
    return double.tryParse(input) != null;
  }

  static bool isCorrectAnswer(double userAnswer, double correctAnswer) {
    return userAnswer == correctAnswer;
  }
}
