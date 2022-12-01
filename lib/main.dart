import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tik_tak_toe/features/action_choice/presentation/pages/action_choice.dart';
import 'package:tik_tak_toe/features/game/presentation/types_of_games/one_player_game/bloc/one_player_game_bloc.dart';
import 'package:tik_tak_toe/features/history/presentation/bloc/history_bloc.dart';

import 'features/action_choice/presentation/pages/game_choice.dart';
import 'features/game/presentation/types_of_games/one_player_game/pages/game_difficulty_choice.dart';
import 'features/game/presentation/types_of_games/one_player_game/pages/one_players_game_page.dart';
import 'features/game/presentation/types_of_games/two_players_game/bloc/two_players_game_bloc.dart';
import 'features/game/presentation/types_of_games/two_players_game/pages/two_players_game_page.dart';
import 'features/history/presentation/pages/history_page.dart';
import 'features/theme/bloc/switch_theme_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory()
  );
  HydratedBlocOverrides.runZoned(() => 
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<SwitchThemeBloc>(
        create: (context) => SwitchThemeBloc(),
      ),
      BlocProvider<TwoPlayersGameBloc>(
        create: (context) => TwoPlayersGameBloc(),
      ),
      BlocProvider<OnePlayerGameBloc>(
        create: (context) => OnePlayerGameBloc(),
      ),
      BlocProvider<HistoryBloc>(
        create: (context) => HistoryBloc(),
      ),
    ],
    child: const MyApp(),
  )),storage: storage);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return BlocBuilder<SwitchThemeBloc, SwitchThemeState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: state.themeData,
          initialRoute: ActionChoice.id,
          routes: {
            ActionChoice.id: (context) => const ActionChoice(),
            GameChoice.id: (context) => const GameChoice(),
            GameLevelChoice.id: (context) => const GameLevelChoice(),
            TwoPlayersGamePage.id: (context) => const TwoPlayersGamePage(),
            OnePlayerGamePage.id: (context) => const OnePlayerGamePage(),
            HistoryPage.id: (context) => const HistoryPage(),
          },
        );
      },
    );
  }
}
