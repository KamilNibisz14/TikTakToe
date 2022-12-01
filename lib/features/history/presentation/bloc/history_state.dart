part of 'history_bloc.dart';

class HistoryState{
  final List<HistoryData> historyData;
  HistoryState({
    this.historyData = const<HistoryData>[]
  });
  
  List<Object> get props => [historyData];

  Map<String, dynamic> toMap(){
    return{
      'history': historyData.map((x) => x.toMap()).toList(),
    };
  }
  factory HistoryState.fromMap(Map<String, dynamic> map){
    return HistoryState(
        historyData: List<HistoryData>.from(map['history']?.map((x) => HistoryData.fromMap(x)))
    );
  }

}
