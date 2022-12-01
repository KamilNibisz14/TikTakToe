import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tik_tak_toe/features/history/presentation/bloc/history_bloc.dart';
import 'package:tik_tak_toe/features/theme/bloc/switch_theme_bloc.dart';

import '../../../../core/domain/entities/player_data_enum.dart';
import '../../../theme/presentation/widgets/theme_setting.dart';
import '../../domain/entities/history_data.dart';

class HistoryPage extends StatelessWidget {
  static const id = 'history_page';
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth / 25;
    Color color;
    List<Container> getHistoryDataWidget(List<HistoryData> historyData) {
      List<Container> historyDataWidgets = [];
      for (int i = 0; i < historyData.length; ++i) {
        String winner = historyData[i].winner;
        String difficultyLevel = historyData[i].difficultyLevel;
        historyDataWidgets.add(Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          child: BlocBuilder<SwitchThemeBloc, SwitchThemeState>(
            builder: (context, state) {
              if (state is LightTheme) {
                color = Colors.black;
              } else {
                color = Colors.white70;
              }
              return Container(
                padding: EdgeInsets.only(bottom: 7),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: color
                    )
                  )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      historyData[i].date,
                      style: TextStyle(fontSize: fontSize),
                    ),
                    Text(
                      winner,
                      style: TextStyle(
                        fontSize: fontSize,
                      ),
                    ),
                    Text(
                      difficultyLevel,
                      style: TextStyle(
                          fontSize: fontSize,
                          color: difficultyLevel == 'easy'
                              ? Colors.green
                              : difficultyLevel == 'medium'
                                  ? Colors.orange
                                  : Colors.red),
                    ),
                  ],
                ),
              );
            },
          ),
        ));
      }
      return historyDataWidgets;
    }

    return BlocBuilder<SwitchThemeBloc, SwitchThemeState>(
      builder: (context, state) {
        if (state is LightTheme) {
          color = Colors.black;
        } else {
          color = Colors.white70;
        }
        return BlocBuilder<HistoryBloc, HistoryState>(
          builder: (context, state) {
            return Scaffold(
              body: Stack(children: [
                Align(
                  alignment: Alignment.topRight,
                  child: ThemeWidget(canPop: true,),
                ),
                SafeArea(
                  child: Container(
                    margin: const EdgeInsets.only(top: 60),
                    child: Center(
                        child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom:
                                        BorderSide(width: 2, color: color))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Date:',
                                  style: TextStyle(
                                    fontSize: fontSize,
                                  ),
                                ),
                                Text(
                                  'Winner:',
                                  style: TextStyle(
                                    fontSize: fontSize,
                                  ),
                                ),
                                Text(
                                  'Level:',
                                  style: TextStyle(
                                    fontSize: fontSize,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            margin: const EdgeInsets.only(top: 80),
                            child: SingleChildScrollView(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children:
                                      getHistoryDataWidget(state.historyData)),
                            ),
                          ),
                        ),
                      ],
                    )),
                  ),
                )
              ]),
            );
          },
        );
      },
    );
  }
}
