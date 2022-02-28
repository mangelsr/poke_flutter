import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:poke_flutter/models/pokemon.dart';
import 'package:poke_flutter/providers/api_provider.dart';
import 'package:poke_flutter/utils/types_colors.dart';
import 'package:poke_flutter/widgets/custom_card.dart';

class DamageTakenCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ApiProvider apiProvider = Provider.of<ApiProvider>(context);
    List<Type> types = apiProvider.selectedPokemon.types;

    final Map<String, int> weakness = Map();
    final Map<String, int> strength = Map();

    Set<String> allWeaks = Set();
    Set<String> allResistant = Set();

    types.forEach((Type element) {
      apiProvider.typesTable[element.type.name].doubleDamageFrom
          .forEach((element) {
        if (weakness.containsKey(element.name))
          weakness[element.name] = weakness[element.name] + 1;
        else
          weakness[element.name] = 1;
      });
      apiProvider.typesTable[element.type.name].halfDamageFrom
          .forEach((element) {
        if (strength.containsKey(element.name))
          strength[element.name] = strength[element.name] + 1;
        else
          strength[element.name] = 1;
      });
    });

    allWeaks.addAll(weakness.keys);
    allResistant.addAll(strength.keys);

    Set<String> intersection = allWeaks.intersection(allResistant);
    List<String> finalWeaks = [...allWeaks.difference(allResistant)];
    finalWeaks.sort();
    List<String> finalResistants = [...allResistant.difference(allWeaks)];
    finalResistants.sort();

    Set<String> normal = Set();
    normal.addAll(apiProvider.typesTable.keys);
    normal = normal.difference(allResistant).difference(allWeaks);
    normal.addAll(intersection);
    normal = normal.difference({'shadow', 'unknown'});

    List<String> normalTypes = [...normal];
    normalTypes.sort();

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
            children: finalWeaks
                .map((String e) => _TypeChip(
                      typeName: e,
                      multiplier: '${weakness[e] * 2}',
                    ))
                .toList(),
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
            children: finalResistants
                .map((String e) => _TypeChip(
                      typeName: e,
                      multiplier: '1/${strength[e] * 2}',
                    ))
                .toList(),
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
            children:
                normalTypes.map((String e) => _TypeChip(typeName: e)).toList(),
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
  final String multiplier;

  const _TypeChip({this.typeName, this.multiplier = '1'});
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
                color: darken(typesColors[typeName]),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
              ),
              child: Center(
                child: Text(
                  'x ${multiplier}',
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
