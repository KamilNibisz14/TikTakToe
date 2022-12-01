import 'package:flutter/material.dart';
import 'package:tik_tak_toe/features/theme/presentation/widgets/theme_setting.dart';

import '../../../../core/widgets/choice_action_button.dart';
import '../../../history/presentation/pages/history_page.dart';
import 'game_choice.dart';

class ActionChoice extends StatelessWidget {
  static const id = 'action_choice_page';
  const ActionChoice({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: ThemeWidget(canPop: false,),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ChoiceActionButton(
                  text: 'Play',
                  onTap: (){
                    Navigator.pushNamed(context, GameChoice.id);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: ChoiceActionButton(
                    text: 'Game history',
                    onTap: (){
                      Navigator.pushNamed(context, HistoryPage.id);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
