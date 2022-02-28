import 'package:flutter/material.dart';
import 'package:poke_flutter/layout/custom_drawer.dart';
import 'package:provider/provider.dart';

import 'package:poke_flutter/widgets/pokemon_tile.dart';
import 'package:poke_flutter/providers/api_provider.dart';

class PokemonListPage extends StatefulWidget {
  static const PAGE_NAME = 'Pokemon List';

  @override
  State<PokemonListPage> createState() => _PokemonListPageState();

  @override
  String toStringShort() {
    return 'Pokédex';
  }
}

class _PokemonListPageState extends State<PokemonListPage> {
  ScrollController _scrollController;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      ApiProvider apiProvider =
          Provider.of<ApiProvider>(context, listen: false);
      _scrollController = ScrollController();
      final int offset = 750;
      _scrollController.addListener(() async {
        final ScrollPosition scrollPosition = _scrollController.position;
        if (!loading &&
            scrollPosition.maxScrollExtent - scrollPosition.pixels <= offset) {
          this.loading = true;
          await apiProvider.getPokemonList();
          this.loading = false;
        }
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ApiProvider apiProvider = Provider.of<ApiProvider>(context);
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Pokedex'),
      //   bottom: _buildProgressIndicator(apiProvider),
      // ),
      body: apiProvider.displayedPokemon.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              controller: _scrollController,
              itemCount: apiProvider.displayedPokemon.length,
              itemBuilder: (_, int index) {
                final pokemon = apiProvider.displayedPokemon[index];
                return PokemonTile(index: index, pokemon: pokemon);
              },
            ),
    );
  }

  Widget _buildProgressIndicator(ApiProvider apiProvider) =>
      apiProvider.fetching && apiProvider.displayedPokemon.isNotEmpty
          ? PreferredSize(
              preferredSize: Size(double.infinity, 1.0),
              child: LinearProgressIndicator(),
            )
          : null;
}
