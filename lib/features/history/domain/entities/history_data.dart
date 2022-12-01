import 'package:tik_tak_toe/features/game/domain/entities/difficulty_level.dart';

import '../../../../core/domain/entities/player_data_enum.dart';

class HistoryData{
  String date;
  String winner;
  String difficultyLevel;

  HistoryData({
    required this.date,
    required this.difficultyLevel,
    required this.winner
  });

  Map<String,dynamic> toMap(){
    return{
      'date': date,
      'winner': winner,
      'difficultyLevel' :difficultyLevel,
    };
  }
  factory HistoryData.fromMap(Map<String, dynamic> map){
    return HistoryData(
      date: map['date']??'',
      winner: map['winner'],
      difficultyLevel: map['difficultyLevel'],
    );
  }
}