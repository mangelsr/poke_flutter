import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:poke_flutter/providers/api_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage();

  @override
  Widget build(BuildContext context) {
    final apiProvider = Provider.of<ApiProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex'),
      ),
      body: apiProvider.pokemon.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: apiProvider.pokemon.length,
              itemBuilder: (_, int index) => ListTile(
                title: Text('${apiProvider.pokemon[index].name}'),
              ),
            ),
    );
  }
}
