// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tik_tak_toe/features/game/presentation/types_of_games/one_player_game/bloc/one_player_game_bloc.dart';

import '../../../../../../core/game_widgets/game_cell.dart';

// ignore: must_be_immutable
class OnePlayerGameTable extends StatelessWidget {
  OnePlayerGameTable({
    Key? key,
    required this.color,
  }) : super(key: key);

  Color color;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnePlayerGameBloc, OnePlayerGameState>(
      builder: (context, state) {
        if(state is OnePlayerGamePlay){
          return Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        context.read<OnePlayerGameBloc>().add(PlayEvent(index: 0));
                      },
                      child: GameCell(
                        player: state.board[0],
                        color: color,
                        isWinningField: state.listOfWonCell[0],
                        rightBorder: true,
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        context.read<OnePlayerGameBloc>().add(PlayEvent(index: 1));
                      },
                      child: GameCell(
                        player: state.board[1],
                        color: color,
                        isWinningField: state.listOfWonCell[1],
                        rightBorder: true,
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        context.read<OnePlayerGameBloc>().add(PlayEvent(index: 2));
                      },
                      child: GameCell(
                        player: state.board[2],
                        color: color,
                        isWinningField: state.listOfWonCell[2],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        context.read<OnePlayerGameBloc>().add(PlayEvent(index: 3));
                      },
                      child: GameCell(
                        player: state.board[3],
                        color: color,
                        isWinningField: state.listOfWonCell[3],
                        rightBorder: true,
                        topBorder: true,
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        context.read<OnePlayerGameBloc>().add(PlayEvent(index: 4));
                      },
                      child: GameCell(
                        player: state.board[4],
                        color: color,
                        isWinningField: state.listOfWonCell[4],
                        topBorder: true,
                        rightBorder: true,
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        context.read<OnePlayerGameBloc>().add(PlayEvent(index: 5));
                      },
                      child: GameCell(
                        player: state.board[5],
                        color: color,
                        isWinningField: state.listOfWonCell[5],
                        topBorder: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        context.read<OnePlayerGameBloc>().add(PlayEvent(index: 6));
                      },
                      child: GameCell(
                        player: state.board[6],
                        color: color,
                        isWinningField: state.listOfWonCell[6],
                        topBorder: true,
                        rightBorder: true,
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        context.read<OnePlayerGameBloc>().add(PlayEvent(index: 7));
                      },
                      child: GameCell(
                        player: state.board[7],
                        color: color,
                        isWinningField: state.listOfWonCell[7],
                        rightBorder: true,
                        topBorder: true,
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        context.read<OnePlayerGameBloc>().add(PlayEvent(index: 8));
                      },
                      child: GameCell(
                        player: state.board[8],
                        color: color,
                        isWinningField: state.listOfWonCell[8],
                        topBorder: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
        }else{
          context.read<OnePlayerGameBloc>().add(StartGameEvent());
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
