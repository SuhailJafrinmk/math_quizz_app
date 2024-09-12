part of 'random_fact_bloc.dart';

@immutable
sealed class RandomFactState {}

final class RandomFactInitial extends RandomFactState {}

class FetchedRandomFact extends RandomFactState {
  final Map<String, String> facts;
  FetchedRandomFact({required this.facts});
}

class ErrorFetchingRandomFact extends RandomFactState {
  final String message;
  ErrorFetchingRandomFact({required this.message});
}
