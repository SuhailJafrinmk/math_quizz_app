import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:math_quizz_app/blocs/timer_cubi/timer_cubit.dart';
import 'package:meta/meta.dart';

part 'score_event.dart';
part 'score_state.dart';

class ScoreBloc extends Bloc<ScoreEvent, ScoreState> {
  int correctanswer = 0;
  int wronganswer = 0;
  ScoreBloc() : super(ScoreInitial()) {
    on<AnswerRight>(correctAnswer);
    on<AnswerWrong>(wrongAnswer);

  }

  FutureOr<void> correctAnswer(AnswerRight event, Emitter<ScoreState> emit) {
    correctanswer++;
      if (correctanswer + wronganswer == 10) {
      emit(ShowScoreBoard(
        rightAnswers: correctanswer,
        wrongAnsers: wronganswer,
        score: correctanswer * 100,
      ));
      _resetScore();
    }
  }


  FutureOr<void> wrongAnswer(AnswerWrong event, Emitter<ScoreState> emit) {
        wronganswer++;
        if (correctanswer + wronganswer == 10) {
      emit(ShowScoreBoard(
        rightAnswers: correctanswer,
        wrongAnsers: wronganswer,
        score: correctanswer * 100,
      ));
      _resetScore();
    }
  }


  // Helper function to reset score values
  void _resetScore() {
    correctanswer = 0;
    wronganswer = 0;
  }
}
