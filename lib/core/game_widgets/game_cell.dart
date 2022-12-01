import 'package:flutter/material.dart';

import '../domain/entities/player_data_enum.dart';
import 'game_cell_text.dart';


// ignore: must_be_immutable
class GameCell extends StatelessWidget {
  GameCell({
    Key? key,
    required this.player,
    required this.color,
    required this.isWinningField,
    this.rightBorder = false,
    this.leftBorder = false,
    this.bottomBorder = false,
    this.topBorder = false,
  }) : super(key: key);

  bool rightBorder;
  bool leftBorder;
  bool topBorder;
  bool bottomBorder;
  Player player;
  Color color;
  bool isWinningField;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: bottomBorder ? 1.0 : 0.0 , color: bottomBorder ? color : Colors.transparent ),
              right: BorderSide(width: rightBorder ? 1.0 : 0.0, color: rightBorder ? color : Colors.transparent),
              top: BorderSide(width: topBorder ? 1.0 : 0.0, color: topBorder ? color : Colors.transparent),
              left : BorderSide(width: leftBorder ? 1.0 : 0.0, color: leftBorder ? color : Colors.transparent),
            )
        ),
        child: GameCellText(
          player: player,
          textColor: color,
          isWinningField: isWinningField,
        )
    );
  }
}
