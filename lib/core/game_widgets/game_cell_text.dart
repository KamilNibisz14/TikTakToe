import 'package:flutter/material.dart';

import '../domain/entities/player_data_enum.dart';

// ignore: must_be_immutable
class GameCellText extends StatelessWidget {
  GameCellText({
    Key? key,
    required this.textColor,
    required this.player,
    required this.isWinningField
  }) : super(key: key);

  Player player;
  Color textColor;
  bool isWinningField;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth / 8;
    return Center(
      child: Text(
        player == Player.playerX ? 'X': player == Player.playerO ? 'O' : ' ',
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.w900,
          color: isWinningField == true?Colors.green:textColor,
        ),
      ),
    );
  }
}
