import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tik_tak_toe/features/game/domain/entities/difficulty_level.dart';

import '../../../../../../core/widgets/choice_action_button.dart';
import '../../../../../theme/presentation/widgets/theme_setting.dart';
import '../bloc/one_player_game_bloc.dart';
import 'one_players_game_page.dart';

class GameLevelChoice extends StatelessWidget {
  static const id = 'game_level_choice_page';
  const GameLevelChoice({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocListener<OnePlayerGameBloc, OnePlayerGameState>(
      listener: (context, state) {
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
                    text: 'Easy',
                    onTap: () {
                      context.read<OnePlayerGameBloc>().add(ResetEvent());
                      context.read<OnePlayerGameBloc>().add(ChoiceDifficultyLevel(difficultyLevel: DifficultyLevel.easy));
                      Navigator.pushNamed(context,OnePlayerGamePage.id);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: ChoiceActionButton(
                      text: 'Medium',
                      onTap: () {
                        context.read<OnePlayerGameBloc>().add(ResetEvent());
                        context.read<OnePlayerGameBloc>().add(ChoiceDifficultyLevel(difficultyLevel: DifficultyLevel.medium));
                        Navigator.pushNamed(context,OnePlayerGamePage.id);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: ChoiceActionButton(
                      text: 'Hard',
                      onTap: () {
                        context.read<OnePlayerGameBloc>().add(ResetEvent());
                        context.read<OnePlayerGameBloc>().add(ChoiceDifficultyLevel(difficultyLevel: DifficultyLevel.hard));
                        Navigator.pushNamed(context,OnePlayerGamePage.id);
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
