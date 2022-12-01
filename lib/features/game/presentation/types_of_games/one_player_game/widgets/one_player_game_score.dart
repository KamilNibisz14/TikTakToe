import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tik_tak_toe/features/game/presentation/types_of_games/one_player_game/bloc/one_player_game_bloc.dart';

import '../../../../../../core/domain/entities/player_data_enum.dart';
import '../../../../../history/presentation/bloc/history_bloc.dart';
import '../../two_players_game/bloc/two_players_game_bloc.dart';

// ignore: must_be_immutable
class OnePlayerGameScore extends StatelessWidget {
  OnePlayerGameScore({Key? key, required this.textColor}) : super(key: key);
  Color textColor;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth / 15;
    return BlocListener<HistoryBloc, HistoryState>(
      listener: (context, state) {
      },
      child: BlocBuilder<OnePlayerGameBloc, OnePlayerGameState>(
        builder: (context, state) {
          if (state is OnePlayerGamePlay) {
            if (state.isTie || state.winner != Player.none) {
              context.read<HistoryBloc>().add(AddValueToHistory(winner: state.winner, difficultyLevel: state.difficultyLevel));
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    'You :',
                    style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.w900,
                        color: state.currPlayer == Player.playerX
                            ? Colors.green
                            : textColor),
                  ),
                ),
                Text(
                  state.winner == Player.none
                      ? ''
                      : state.winner == Player.playerX
                          ? 'You win'
                          : 'CPU win',
                  style: TextStyle(
                      fontSize: fontSize, fontWeight: FontWeight.w900),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Text(
                    ': CPU',
                    style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.w900,
                        color: state.currPlayer == Player.playerO
                            ? Colors.green
                            : textColor),
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
