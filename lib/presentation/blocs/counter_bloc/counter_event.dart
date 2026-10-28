part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent {}

class CounterIncreased extends CounterEvent {
  final int value;

  CounterIncreased({
    required this.value
  });
}

class CounterReset extends CounterEvent {}
