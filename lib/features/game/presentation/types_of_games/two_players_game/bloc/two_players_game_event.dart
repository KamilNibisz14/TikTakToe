part of 'two_players_game_bloc.dart';

abstract class TwoPlayersGameEvent extends Equatable {
  const TwoPlayersGameEvent();

  @override
  List<Object> get props => [];
}

class StartGameEvent extends TwoPlayersGameEvent{}

// ignore: must_be_immutable
class PlayEvent extends TwoPlayersGameEvent{
  int index;
  PlayEvent({required this.index});

  @override
  List<Object> get props => [index];
}
class ResetEvent extends TwoPlayersGameEvent{}


