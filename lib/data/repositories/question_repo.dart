import 'dart:math';
import 'package:math_quizz_app/data/models/question_model.dart';

class QuestionRepository {
  Question generateQuestion() {
    final question = Question.generateRandomQuestion();
    return question;
  }
}
