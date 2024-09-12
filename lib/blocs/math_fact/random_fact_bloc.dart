import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:math_quizz_app/data/repositories/random_fact_repo.dart';
import 'package:meta/meta.dart';

part 'random_fact_event.dart';
part 'random_fact_state.dart';

class RandomFactBloc extends Bloc<RandomFactEvent, RandomFactState> {
  RandomFactBloc() : super(RandomFactInitial()) {
    on<GetRandomFact>(getRandomFact);
  }

  FutureOr<void> getRandomFact(
      GetRandomFact event, Emitter<RandomFactState> emit) async {
    try {
      final response = await RandomFactRepo.getRandomFact();
      emit(FetchedRandomFact(facts: response));
    } catch (e) {
      emit(ErrorFetchingRandomFact(message: e.toString()));
    }
  }
}
