import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../theme/bloc/switch_theme_bloc.dart';
import '../widgets/one_player_game_score.dart';
import '../widgets/one_player_game_table.dart';

class OnePlayerGamePage extends StatelessWidget {
  static const id = 'one_player_game_page';
  const OnePlayerGamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double gameScoreHeight = screenWidth / 7;
    double gameTableSize = screenWidth * 0.95;

    Color appBarColor;
    Color color;

    return BlocBuilder<SwitchThemeBloc, SwitchThemeState>(
      builder: (context, state) {
        if(state is LightTheme){
          appBarColor = Colors.indigoAccent;
          color = Colors.black;
        }else{
          appBarColor = Colors.grey.shade800;
          color = Colors.white70;
        }
        return Scaffold(
          appBar: AppBar(
             backgroundColor: appBarColor,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  height: gameScoreHeight,
                  child: OnePlayerGameScore(textColor: color,)
              ),
              SizedBox(
                  width: gameTableSize,
                  height: gameTableSize,
                  child: OnePlayerGameTable(color: color,)
              ),
              SizedBox(
                height: gameScoreHeight,
              )
            ],
          ),
        );
      },
    );
  }
}
