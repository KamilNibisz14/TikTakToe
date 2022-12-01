import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tik_tak_toe/features/game/presentation/types_of_games/two_players_game/bloc/two_players_game_bloc.dart';

import '../../../../../../core/domain/entities/player_data_enum.dart';

class TwoPlayersGameScore extends StatelessWidget {
  TwoPlayersGameScore({
    Key? key,
    required this.textColor
    }) : super(key: key);
  Color textColor;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth / 15;
    return BlocBuilder<TwoPlayersGameBloc, TwoPlayersGameState>(
      builder: (context, state) {
        if(state is TwoPlayersGamePlay){
          return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                'X :',
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w900,
                  color: state.currPlayer == Player.playerX ? Colors.green : textColor
                ),
              ),
            ),
            Text(
              state.winner == Player.none?'':state.winner == Player.playerX ?'X win':'O win',
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w900
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Text(
                ': O',
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w900,
                  color: state.currPlayer == Player.playerO ? Colors.green : textColor
                ),
              ),
            ),
          ],
        );
        }else{
          return const Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }
}
