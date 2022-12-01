import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/switch_theme_bloc.dart';

class SwitchThemeWidget extends StatelessWidget {
  const SwitchThemeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwitchThemeBloc, SwitchThemeState>(
      builder: (context, state) {
        return Switch(
          value: state.isDarkMode,
          onChanged: (bool value) {
            context.read<SwitchThemeBloc>().add(ChangeThemeEvent());
          },
        );
      },
    );
  }
}
