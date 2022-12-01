import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tik_tak_toe/features/game/presentation/types_of_games/two_players_game/bloc/two_players_game_bloc.dart';

import '../../../../core/widgets/choice_action_button.dart';
import '../../../game/presentation/types_of_games/two_players_game/pages/two_players_game_page.dart';
import '../../../theme/presentation/widgets/theme_setting.dart';
import '../../../game/presentation/types_of_games/one_player_game/pages/game_difficulty_choice.dart';

class GameChoice extends StatelessWidget {
  static const id = 'game_choice_page';
  const GameChoice({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocListener<TwoPlayersGameBloc, TwoPlayersGameState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      child: Scaffold(
        body: Stack(
          children: [
             Align(
              alignment: Alignment.topRight,
              child: ThemeWidget(canPop: true,),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ChoiceActionButton(
                    text: 'One player',
                    onTap: () {
                      Navigator.pushNamed(context, GameLevelChoice.id);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: ChoiceActionButton(
                      text: 'Two players',
                      onTap: () {
                        context.read<TwoPlayersGameBloc>().add(ResetEvent());
                        Navigator.pushNamed(context, TwoPlayersGamePage.id);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
