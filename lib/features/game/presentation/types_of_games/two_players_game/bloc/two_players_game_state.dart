part of 'two_players_game_bloc.dart';

abstract class TwoPlayersGameState{
  const TwoPlayersGameState();
  
  List<Object> get props => [];
}


class TwoPlayersGameStart extends TwoPlayersGameState {}
class TwoPlayersGamePlay extends TwoPlayersGameState {
  Player currPlayer;
  Player winner;
  List<Player> board;
  List<bool> listOfWonCell;

  TwoPlayersGamePlay({
    required this.board,
    required this.currPlayer,
    required this.listOfWonCell,
    required this.winner
  });

}
