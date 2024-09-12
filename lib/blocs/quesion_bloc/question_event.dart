part of 'question_bloc.dart';

@immutable
sealed class QuestionEvent {}

class LoadNewQuestion extends QuestionEvent {}

class SubmitAnswer extends QuestionEvent {
  final double answer;
  SubmitAnswer(this.answer);
}
