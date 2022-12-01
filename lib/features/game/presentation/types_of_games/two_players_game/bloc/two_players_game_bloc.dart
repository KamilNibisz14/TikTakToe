import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tik_tak_toe/core/domain/entities/player_data_enum.dart';

part 'two_players_game_event.dart';
part 'two_players_game_state.dart';

class TwoPlayersGameBloc extends Bloc<TwoPlayersGameEvent, TwoPlayersGameState> {
  Player currPlayer = Player.playerX;
  bool canPlay = true;
  Player winner = Player.none;
  List<Player> board = List.filled(9, Player.none);
  List<bool> listOfWonCell = List.filled(9, false);
  var winLines = [[0,1,2], [3, 4, 5 ],[6, 7, 8 ],[ 0, 3, 6 ],[1, 4, 7],[2, 5, 8],[ 0, 4, 8],[2, 4, 6 ] ];
  TwoPlayersGameBloc() : super(TwoPlayersGameStart()) {
    on<TwoPlayersGameEvent>((event, emit) {
      if(event is StartGameEvent){

        emit(TwoPlayersGamePlay(
          board: board,
          currPlayer: currPlayer,
          winner: winner,
          listOfWonCell: listOfWonCell
        ));
      }
    });
    on<PlayEvent>(_onPlayEvent);
    on<ResetEvent>(_onResetEvent);
  }
  _onResetEvent(ResetEvent event, Emitter<TwoPlayersGameState> emit ){
    reset();
    emit(TwoPlayersGamePlay(
      board: board,
      currPlayer: currPlayer,
      winner: winner,
      listOfWonCell: listOfWonCell
    ));
  }
  _onPlayEvent(PlayEvent event, Emitter<TwoPlayersGameState> emit){
    if(canPlay){
      step(event.index);
    }else{
      reset();
    }
    emit(TwoPlayersGamePlay(
      board: board,
      currPlayer: currPlayer,
      winner: winner,
      listOfWonCell: listOfWonCell
    ));
  }

  void step(int index){
    if(board[index] == Player.none){
      board[index] = currPlayer;
      if(currPlayer == Player.playerX){
        currPlayer = Player.playerO;
      }else{
        currPlayer = Player.playerX;
      }
      canPlay = solve();
    }
  }
  void reset(){
    for(int i = 0; i < 9; ++i){
      board[i] = Player.none;
      listOfWonCell[i] = false;
    }
    canPlay = true;
    winner = Player.none;
  }
  bool solve(){
    for(int i = 0; i < 8; ++i){
      if(board[winLines[i][0]] != Player.none &&
         board[winLines[i][0]] == board[winLines[i][1]] &&
         board[winLines[i][0]] == board[winLines[i][2]]){
        listOfWonCell[winLines[i][0]] = true;
        listOfWonCell[winLines[i][1]] = true;
        listOfWonCell[winLines[i][2]] = true;
        if(board[winLines[i][0]] == Player.playerX){
          winner = Player.playerX;
        }
        else if(board[winLines[i][0]] == Player.playerO){
          winner = Player.playerO;
        }
        return false;
      }
    }
    return checkBoard();
  }
  bool checkBoard(){
    int counter = 0;
    for(int i = 0; i < 9; ++i)
    {
      if(board[i] != Player.none){
        counter++;
      }
    }
    if(counter == 9){
      return false;
    }else{
      return true;
    }
  }

}
