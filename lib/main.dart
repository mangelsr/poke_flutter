import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:poke_flutter/pages/pages.dart';
import 'package:poke_flutter/providers/providers.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => ApiProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => NavigationProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => MovesProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => ThemeProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => DrawerProvider(),
      ),
    ],
    child: PokeFlutterApp(),
  ));
}

class PokeFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Poke Flutter',
      theme: themeProvider.actualTheme,
      routes: {
        MainPage.PAGE_NAME: (_) => MainPage(),
        PokemonDetailPage.PAGE_NAME: (_) => PokemonDetailPage(),
      },
      initialRoute: MainPage.PAGE_NAME,
    );
  }
}
