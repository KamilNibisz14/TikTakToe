import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../../../core/domain/entities/player_data_enum.dart';
import '../../../../domain/entities/difficulty_level.dart';

part 'one_player_game_event.dart';
part 'one_player_game_state.dart';

class OnePlayerGameBloc extends Bloc<OnePlayerGameEvent, OnePlayerGameState> {
  Player currPlayer = Player.playerX;
  bool canPlay = true;
  Player winner = Player.none;
  List<Player> board = List.filled(9, Player.none);
  List<bool> listOfWonCell = List.filled(9, false);
  DifficultyLevel difficultyLevel = DifficultyLevel.easy;
  bool isTie = false;
  Random random = Random();
  var winLines = [[0,1,2], [3, 4, 5 ],[6, 7, 8 ],[ 0, 3, 6 ],[1, 4, 7],[2, 5, 8],[ 0, 4, 8],[2, 4, 6 ] ];
  OnePlayerGameBloc() : super(OnePlayerGameStart()) {
    on<OnePlayerGameEvent>((event, emit) {
      if(event is StartGameEvent){
        emit(OnePlayerGamePlay(
          board: board,
          currPlayer: currPlayer,
          winner: winner,
          listOfWonCell: listOfWonCell,
          difficultyLevel: difficultyLevel,
          isTie: isTie,
        ));
      }
    });
    on<PlayEvent>(_onPlayEvent);
    on<ChoiceDifficultyLevel>(_onChoiceDifficultyLevel);
    on<ResetEvent>(_onResetEvent);
  }
  _onChoiceDifficultyLevel(ChoiceDifficultyLevel event, Emitter<OnePlayerGameState> emit){
    difficultyLevel = event.difficultyLevel;
  }
  _onResetEvent(ResetEvent event, Emitter<OnePlayerGameState> emit){
    reset();
    emit(OnePlayerGamePlay(
    board: board,
    currPlayer: currPlayer,
    winner: winner,
    listOfWonCell: listOfWonCell,
    difficultyLevel: difficultyLevel,
    isTie: isTie,
    ));
  }
  _onPlayEvent(PlayEvent event, Emitter<OnePlayerGameState> emit){
    if(canPlay){
      step(event.index);
    }else{
      reset();
    }
    emit(OnePlayerGamePlay(
      board: board,
      currPlayer: currPlayer,
      winner: winner,
      listOfWonCell: listOfWonCell,
      difficultyLevel: difficultyLevel,
      isTie: isTie,
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
      if(canPlay){
        CPUMove();
        canPlay = solve();
      }
    }
  }
  // ignore: non_constant_identifier_names
  void CPUMove(){
    List<int> randomList = [];
    var checkLines;
    int sizeLines = 0;
    if(difficultyLevel == DifficultyLevel.easy){
      sizeLines = 3;
      checkLines = List.generate(3, (i) => List.filled(3,0), growable: false);
      for(int i = 0; i < sizeLines; ++i)
      {
        do {
          bool t = true;
          int randomNumber = random.nextInt(8);
          for(int j = 0; j < randomList.length; ++j)
          {
            if(randomList[j] == randomNumber) {
              t = false;
            }
          }
          if(t == true)
          {
            randomList.add(randomNumber);
            checkLines[i] = winLines[randomNumber];
            break;
          }
        }while(true);
      }
    }else if( difficultyLevel == DifficultyLevel.medium)
    {
      sizeLines = 5;
      checkLines = List.generate(5, (i) => List.filled(3,0), growable: false);
      for(int i = 0; i < sizeLines; ++i)
      {
        do {
          bool t = true;
          int randomNumber = random.nextInt(8);
          for(int j = 0; j < randomList.length; ++j)
          {
            if(randomList[j] == randomNumber) {
              t = false;
            }
          }
          if(t == true)
          {
            randomList.add(randomNumber);
            checkLines[i] = winLines[randomNumber];
            break;
          }
        }while(true);
      }
    }
    else if( difficultyLevel == DifficultyLevel.hard)
    {
      sizeLines = 8;
      checkLines = List.generate(8, (i) => List.filled(3,0), growable: false);
      for(int i = 0; i < 8; ++i)
      {
        checkLines = winLines;
      }
    }

    bool check = false;
    if(board[4] == Player.none)
    {
      board[4] = Player.playerO;
      check = true;
    }
    if(check == false)
    {
      for(int i = 0; i < sizeLines; ++i)
      {
        if(board[checkLines[i][0]] == Player.none && board[checkLines[i][1]] == Player.playerO && board[checkLines[i][2]] == Player.playerO)
        {
          board[checkLines[i][0]] = Player.playerO;
          check = true;
          break;
        }
        else if ( board[checkLines[i][1]] == Player.none && board[checkLines[i][0]] == Player.playerO && board[checkLines[i][2]] == Player.playerO)
        {
          board[checkLines[i][1]] = Player.playerO;
          check = true;
          break;
        }
        else if ( board[checkLines[i][2]] == Player.none && board[checkLines[i][0]] == Player.playerO && board[checkLines[i][1]] == Player.playerO)
        {
          board[checkLines[i][2]] = Player.playerO;
          check = true;
          break;
        }
      }
    }

    if(check == false)
    {
      for(int i = 0; i < sizeLines; ++i)
      {
        if(board[checkLines[i][0]] == Player.none && board[checkLines[i][1]] == Player.playerX && board[checkLines[i][2]] == Player.playerX)
        {
          board[checkLines[i][0]] = Player.playerO;
          check = true;
          break;
        }
        else if ( board[checkLines[i][1]] == Player.none && board[checkLines[i][0]] == Player.playerX && board[checkLines[i][2]] == Player.playerX)
        {
          board[checkLines[i][1]] = Player.playerO;
          check = true;
          break;
        }
        else if ( board[checkLines[i][2]] == Player.none && board[checkLines[i][0]] == Player.playerX && board[checkLines[i][1]] == Player.playerX)
        {
          board[checkLines[i][2]] = Player.playerO;
          check = true;
          break;
        }
      }
    }

    if(check == false) {
      Random random = Random();
      int rand;
      do {
        rand = random.nextInt(9);
        if (board[rand] == Player.none) {
          board[rand] = Player.playerO;
          break;
        }
      } while (true);
    }
    currPlayer = Player.playerX;

  }
  void reset(){
    for(int i = 0; i < 9; ++i){
      board[i] = Player.none;
      listOfWonCell[i] = false;
    }
    canPlay = true;
    winner = Player.none;
    isTie = false;
    if(currPlayer == Player.playerO)
    {
      CPUMove();
    }
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
      isTie = true;
      return false;
    }else{
      return true;
    }
  }
}