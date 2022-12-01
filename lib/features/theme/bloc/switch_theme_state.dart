part of 'switch_theme_bloc.dart';

abstract class SwitchThemeState extends Equatable {
  ThemeData themeData;
  bool isDarkMode;
  SwitchThemeState({required this.themeData, required this.isDarkMode});
  
  @override
  List<Object> get props => [themeData,isDarkMode ];
}


class LightTheme extends SwitchThemeState {
  LightTheme({required super.themeData, required super.isDarkMode});
}
class DarkTheme extends SwitchThemeState {
  DarkTheme({required super.themeData,required super.isDarkMode});
}
