part of 'random_fact_bloc.dart';

@immutable
sealed class RandomFactEvent {}
class GetRandomFact extends RandomFactEvent{}