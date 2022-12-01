import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:tik_tak_toe/core/domain/entities/player_data_enum.dart';
import 'package:tik_tak_toe/features/game/domain/entities/difficulty_level.dart';
import 'package:tik_tak_toe/features/history/domain/entities/history_data.dart';
import 'dart:convert';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends HydratedBloc<HistoryEvent, HistoryState> {

  List<HistoryData> historyData = [];

  HistoryBloc() : super(HistoryState()) {
    on<HistoryEvent>((event, emit) {
    });
    on<AddValueToHistory>(_onAddValueToHistory);
  }

  _onAddValueToHistory(AddValueToHistory event, Emitter<HistoryState> emit){
    String winner;
    if(event.winner == Player.playerX){
      winner = "Player";
    }else if(event.winner == Player.playerO){
      winner = "CPU";
    } else{
      winner = "Draw";
    }
    HistoryData tmp = HistoryData(
      winner: winner,
      difficultyLevel: event.difficultyLevel.name,
      date: DateTime.now().toString().substring(0,10),
    );
    
    historyData.add(tmp);
    emit(HistoryState(historyData: historyData));
  }

  @override
  HistoryState? fromJson(Map<String, dynamic> json) {
    return HistoryState.fromMap(json);
    //throw UnimplementedError();
  }

  @override
  Map<String, dynamic>? toJson(HistoryState state) {
    return state.toMap();
    //throw UnimplementedError();
  }


}
