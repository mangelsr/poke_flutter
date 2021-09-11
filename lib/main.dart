import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:poke_flutter/pages/pages.dart';
import 'package:poke_flutter/providers/providers.dart';

void main() {
  runApp(PokeFlutterApp());
}

class PokeFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
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
      ],
      child: MaterialApp(
        title: 'Poke Flutter',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          HomePage.PAGE_NAME: (_) => HomePage(),
          DetailPage.PAGE_NAME: (_) => DetailPage(),
        },
        initialRoute: HomePage.PAGE_NAME,
      ),
    );
  }
}
