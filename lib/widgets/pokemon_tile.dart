import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:poke_flutter/models/pokemon.dart';
import 'package:poke_flutter/pages/detail_page.dart';
import 'package:poke_flutter/providers/providers.dart';
import 'package:poke_flutter/utils/string_extension.dart';
import 'package:poke_flutter/widgets/type_badge.dart';

class PokemonTile extends StatelessWidget {
  const PokemonTile({@required this.index, @required this.pokemon});

  final int index;
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    final ApiProvider apiProvider = Provider.of<ApiProvider>(context);
    final MovesProvider movesProvider = Provider.of<MovesProvider>(context);
    final ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    final String titleText =
        '#${pokemon.order.toString().padLeft(3, '0')} ${pokemon.name.toTitleCase()}';
    final List<String> types =
        pokemon.types.map((Type e) => e.type.name.toUpperCase()).toList();

    final textColor = pokemon.averageColor.computeLuminance() > 0.35
        ? Colors.black
        : Colors.white;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: ListTile(
        tileColor: pokemon.averageColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        onTap: () {
          apiProvider.setSelectedPokemon(this.index);
          themeProvider.changeTheme(apiProvider.selectedPokemon.averageColor);
          movesProvider.setPokemonMoves(apiProvider.selectedPokemon);
          Navigator.pushNamed(context, DetailPage.PAGE_NAME);
        },
        title: Text(
          titleText,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
        subtitle: Row(
          children:
              types.map((String e) => Expanded(child: TypeBadge(e))).toList(),
        ),
        trailing: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 0.5),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              bottomLeft: Radius.circular(20.0),
            ),
          ),
          child:
              Image.network(pokemon.sprites.other.officialArtwork.frontDefault),
        ),
      ),
    );
  }
}
