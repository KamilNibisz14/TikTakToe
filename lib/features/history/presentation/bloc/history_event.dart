part of 'history_bloc.dart';

abstract class HistoryEvent extends Equatable {
  const HistoryEvent();

  @override
  List<Object> get props => [];
}

class AddValueToHistory extends HistoryEvent{
  Player winner;
  DifficultyLevel difficultyLevel;
  AddValueToHistory({required this.winner, required this.difficultyLevel});

  @override
  List<Object> get props => [winner, difficultyLevel];
}
