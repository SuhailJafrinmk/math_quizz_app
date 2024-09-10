import 'dart:math';
import 'package:math_quizz_app/data/models/question_model.dart';

class QuestionRepository {
  // List<Question> generateQuestions(int numberOfQuestions) {
  //   // List<Question> questions = [];
  //   // for (int i = 0; i < numberOfQuestions; i++) {
  //   //   questions.add(Question.generateRandomQuestion());
  //   // }
    // return questions;
  // }
  Question generateQuestion(){
    final question=Question.generateRandomQuestion();
    return question;
  }
}
