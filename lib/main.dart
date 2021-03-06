import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:poke_flutter/pages/home_page.dart';
import 'package:poke_flutter/providers/api_provider.dart';

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
        )
      ],
      child: MaterialApp(
        title: 'Poke Flutter',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {'home': (_) => HomePage()},
        initialRoute: 'home',
      ),
    );
  }
}
