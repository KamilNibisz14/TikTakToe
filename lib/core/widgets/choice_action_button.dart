import 'package:flutter/material.dart';

class ChoiceActionButton extends StatelessWidget {
  ChoiceActionButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);
  String text;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double buttonWidth = screenWidth / 2.5;
    double buttonHeight = screenWidth / 6;
    double fontSize = screenWidth / 23;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: buttonWidth,
        height: buttonHeight,
        decoration: BoxDecoration(
          color: Colors.indigoAccent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: fontSize
            ),
          ),
        ),
      ),
    );
  }
}
