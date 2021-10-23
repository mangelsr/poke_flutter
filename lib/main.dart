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
        HomePage.PAGE_NAME: (_) => HomePage(),
        DetailPage.PAGE_NAME: (_) => DetailPage(),
      },
      initialRoute: HomePage.PAGE_NAME,
    );
  }
}
