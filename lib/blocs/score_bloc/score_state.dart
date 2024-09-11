part of 'score_bloc.dart';

@immutable
sealed class ScoreState {}

final class ScoreInitial extends ScoreState {}
class ShowScoreBoard extends ScoreState{
  final int rightAnswers;
  final int wrongAnsers;
  final int score;
  ShowScoreBoard({required this.rightAnswers, required this.wrongAnsers,required this.score});
}
