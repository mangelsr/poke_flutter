import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:poke_flutter/models/pokemon.dart';
import 'package:poke_flutter/models/type_response.dart';
import 'package:poke_flutter/providers/api_provider.dart';
import 'package:poke_flutter/utils/types_colors.dart';
import 'package:poke_flutter/widgets/custom_card.dart';

class DamageTakenCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ApiProvider apiProvider = Provider.of<ApiProvider>(context);
    List<Type> types = apiProvider.selectedPokemon.types;

    Set<String> allWeaks = Set();
    Set<String> allResistant = Set();
    types.forEach((Type element) {
      allWeaks.addAll(apiProvider.typesTable[element.type.name].doubleDamageFrom
          .map((Generation e) => e.name.toLowerCase()));
      allResistant.addAll(apiProvider
          .typesTable[element.type.name].halfDamageFrom
          .map((Generation e) => e.name.toLowerCase()));
    });

    Set<String> intersection = allWeaks.intersection(allResistant);
    Set<String> finalWeaks = allWeaks.difference(allResistant);
    Set<String> finalResistants = allResistant.difference(allWeaks);

    Set<String> normal = Set();
    normal.addAll(apiProvider.typesTable.keys);
    normal = normal.difference(allResistant).difference(allWeaks);
    normal.addAll(intersection);

    return CustomCard(
      child: Column(
        children: [
          _DamageTakenInnerTitle('Weak against...'),
          SizedBox(height: 5),
          GridView.count(
            shrinkWrap: true,
            mainAxisSpacing: 6,
            crossAxisSpacing: 6,
            crossAxisCount: 3,
            childAspectRatio: 4,
            primary: false,
            children: finalWeaks.map((String e) => _TypeChip(e)).toList(),
          ),
          SizedBox(height: 10),
          _DamageTakenInnerTitle('Resistant against...'),
          SizedBox(height: 5),
          GridView.count(
            shrinkWrap: true,
            mainAxisSpacing: 6,
            crossAxisSpacing: 6,
            crossAxisCount: 3,
            childAspectRatio: 4,
            primary: false,
            children: finalResistants.map((String e) => _TypeChip(e)).toList(),
          ),
          SizedBox(height: 10),
          _DamageTakenInnerTitle('Normal damage from...'),
          SizedBox(height: 5),
          GridView.count(
            shrinkWrap: true,
            mainAxisSpacing: 6,
            crossAxisSpacing: 6,
            crossAxisCount: 3,
            childAspectRatio: 4,
            primary: false,
            children: normal.map((String e) => _TypeChip(e)).toList(),
          ),
        ],
      ),
    );
  }
}

class _DamageTakenInnerTitle extends StatelessWidget {
  final String text;

  const _DamageTakenInnerTitle(this.text);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black54,
        fontSize: 16,
      ),
    );
  }
}

class _TypeChip extends StatelessWidget {
  final String typeName;

  const _TypeChip(this.typeName);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                color: typesColors[typeName],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                ),
              ),
              child: Center(
                child: Text(
                  typeName.toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                color: typesColors[typeName],
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
              ),
              child: Center(
                child: Text(
                  'x 1',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
