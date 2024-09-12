import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:math_quizz_app/data/models/question_model.dart';
import 'package:math_quizz_app/data/repositories/question_repo.dart';
import 'package:meta/meta.dart';
part 'question_event.dart';
part 'question_state.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  final QuestionRepository questionRepository;
  QuestionBloc(this.questionRepository) : super(QuestionInitial()) {
    on<LoadNewQuestion>(loadNewQuestion);
    on<SubmitAnswer>(submitAnswer);
  }

  FutureOr<void> loadNewQuestion(LoadNewQuestion event, Emitter<QuestionState> emit) {
      final question=questionRepository.generateQuestion();
      emit(QuestionLoaded(question));
  }

  FutureOr<void> submitAnswer(SubmitAnswer event, Emitter<QuestionState> emit) {
    final question=(state as QuestionLoaded).question;
    if(question.correctAnswer==event.answer){
      emit(CorrectAnswer());
    }else{
      emit(WrongAnswer());
    }
  }
}
