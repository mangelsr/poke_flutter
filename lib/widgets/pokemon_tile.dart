import 'package:flutter/material.dart';
import 'package:poke_flutter/models/pokemon.dart';
import 'package:poke_flutter/utils/string_extension.dart';
import 'package:poke_flutter/widgets/type_badge.dart';

class PokemonTile extends StatelessWidget {
  const PokemonTile({@required this.pokemon});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    final titleText = '#${pokemon.order} ${pokemon.name.toTitleCase()}';
    final types = pokemon.types.map((Type e) => e.type.name.toUpperCase());
    return Container(
      margin: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: pokemon.averageColor,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: ListTile(
          title: Text(titleText),
          subtitle: Row(
            children: types.map((String e) => TypeBadge(e)).toList(),
          ),
          trailing: Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 0.5),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0),
              ),
            ),
            child: Expanded(
              child: Image.network(
                  pokemon.sprites.other.officialArtwork.frontDefault),
            ),
          )),
    );
  }
}
