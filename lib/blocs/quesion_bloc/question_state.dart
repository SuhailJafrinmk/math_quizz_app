part of 'question_bloc.dart';

@immutable
sealed class QuestionState {}

final class QuestionInitial extends QuestionState {}
class QuestionLoaded extends QuestionState {
  final Question question;

  QuestionLoaded(this.question);
}
class CorrectAnswer extends QuestionState{}
class WrongAnswer extends QuestionState{}