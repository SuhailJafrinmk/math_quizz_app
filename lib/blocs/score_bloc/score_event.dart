part of 'score_bloc.dart';

@immutable
sealed class ScoreEvent {}
class AnswerWrong extends ScoreEvent{}
class AnswerRight extends ScoreEvent{}
class QuestionIncrement extends ScoreEvent{}