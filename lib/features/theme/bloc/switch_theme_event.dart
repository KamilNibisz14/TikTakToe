part of 'switch_theme_bloc.dart';

abstract class SwitchThemeEvent extends Equatable {
  const SwitchThemeEvent();

  @override
  List<Object> get props => [];
}

class ChangeThemeEvent extends SwitchThemeEvent{}
