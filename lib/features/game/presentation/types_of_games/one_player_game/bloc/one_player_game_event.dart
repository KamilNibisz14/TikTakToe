part of 'one_player_game_bloc.dart';

abstract class OnePlayerGameEvent extends Equatable {
  const OnePlayerGameEvent();

  @override
  List<Object> get props => [];
}

class StartGameEvent extends OnePlayerGameEvent{}

// ignore: must_be_immutable
class PlayEvent extends OnePlayerGameEvent{
  int index;
  PlayEvent({required this.index});

  @override
  List<Object> get props => [index];
}

// ignore: must_be_immutable
class ChoiceDifficultyLevel extends OnePlayerGameEvent{
  DifficultyLevel difficultyLevel;
  ChoiceDifficultyLevel({required this.difficultyLevel});

  @override
  List<Object> get props => [difficultyLevel];
}

class ResetEvent extends OnePlayerGameEvent{}
