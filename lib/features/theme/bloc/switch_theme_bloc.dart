import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tik_tak_toe/features/theme/data/dark_theme_data.dart';
import 'package:tik_tak_toe/features/theme/data/light_theme_data.dart';

part 'switch_theme_event.dart';
part 'switch_theme_state.dart';

class SwitchThemeBloc extends Bloc<SwitchThemeEvent, SwitchThemeState> {
  SwitchThemeBloc() : super(LightTheme(themeData:lightTheme, isDarkMode: false)) {
    on<SwitchThemeEvent>((event, emit) {
    });
    on<ChangeThemeEvent>(_onChangeThemeEvent);
  }
  _onChangeThemeEvent(ChangeThemeEvent event, Emitter<SwitchThemeState> emit){
    if(state is DarkTheme){
      emit(LightTheme(themeData: lightTheme, isDarkMode: false));
    }
    else {
      emit(DarkTheme(themeData: darkTheme, isDarkMode: true));
    }
  }
}
