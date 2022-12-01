import 'package:flutter/material.dart';
import 'package:tik_tak_toe/features/theme/presentation/widgets/switch_theme_widget.dart';

class ThemeWidget extends StatelessWidget {
  ThemeWidget({
    Key? key,
    required this.canPop
    }) : super(key: key);
  bool canPop;


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double iconSize = screenWidth / 20;
    double arrowIconSize = screenWidth / 17;

    const double paddingSize = 10;

    return  SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(left: paddingSize),
                child: GestureDetector(
                  onTap: (){
                     canPop == true? Navigator.pop(context):null;
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: arrowIconSize,
                    ),
                )
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: paddingSize),
                    child: Icon(
                      Icons.sunny,
                      size: iconSize,
                    ),
                  ),
                  const SwitchThemeWidget(),
                  Icon(
                    Icons.nightlight,
                    size: iconSize,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
