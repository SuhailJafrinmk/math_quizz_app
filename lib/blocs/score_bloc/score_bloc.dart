import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'score_event.dart';
part 'score_state.dart';

class ScoreBloc extends Bloc<ScoreEvent, ScoreState> {
  int correctanswer=0;
  int wronganswer=0;
  ScoreBloc() : super(ScoreInitial()) {
    on<AnswerRight>(correctAnswer);
    on<AnswerWrong>(wrongAnswer);
    on<QuestionIncrement>(questionIncrement);
  }

  FutureOr<void> correctAnswer(AnswerRight event, Emitter<ScoreState> emit) {
    correctanswer++;
  }

  FutureOr<void> wrongAnswer(AnswerWrong event, Emitter<ScoreState> emit) {
    wronganswer++;
  }



  FutureOr<void> questionIncrement(QuestionIncrement event, Emitter<ScoreState> emit) {
    if(correctanswer+wronganswer==10){
      emit(ShowScoreBoard(rightAnswers:correctanswer,wrongAnsers: wronganswer));
      correctanswer=0;
      wronganswer=0;
    }
  }
}
