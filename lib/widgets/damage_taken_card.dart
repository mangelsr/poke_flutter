import 'package:flutter/material.dart';

import 'package:poke_flutter/widgets/custom_card.dart';

class DamageTakenCard extends StatelessWidget {
  final weakElements = [
    {'name': 'FLYING', 'value': 2, 'color': Colors.purple[800]},
    {'name': 'FIRE', 'value': 2, 'color': Colors.orange[800]},
    {'name': 'PSYPHIC', 'value': 2, 'color': Colors.pink},
    {'name': 'ICE', 'value': 2, 'color': Colors.blue[800]},
  ];

  @override
  Widget build(BuildContext context) {
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
            children: weakElements
                .map((Map<String, Object> e) => _TypeChip(e))
                .toList(),
          ),
          // _DamageTakenInnerTitle('Resistant against...'),
          // _DamageTakenInnerTitle('Normal damage from...'),
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
  final Map<String, Object> e;

  const _TypeChip(this.e);
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
                color: e['color'],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                ),
              ),
              child: Center(
                child: Text(
                  e['name'],
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
                color: e['color'],
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
              ),
              child: Center(
                child: Text(
                  'x${e['value']}',
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
