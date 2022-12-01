part of 'one_player_game_bloc.dart';

abstract class OnePlayerGameState{
  const OnePlayerGameState();

  List<Object> get props => [];
}

class OnePlayerGameStart extends OnePlayerGameState {}
class OnePlayerGamePlay extends OnePlayerGameState {
  Player currPlayer;
  Player winner;
  List<Player> board;
  List<bool> listOfWonCell;
  DifficultyLevel difficultyLevel;
  bool isTie;
  OnePlayerGamePlay({
    required this.board,
    required this.currPlayer,
    required this.listOfWonCell,
    required this.winner,
    required this.difficultyLevel,
    required this.isTie,
  });
}
