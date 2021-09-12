import 'package:flutter/material.dart';

import 'package:poke_flutter/widgets/custom_card.dart';

class SpeciesCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        children: [
          _SpeciesData(
            title: 'Pokédex entry (from INSERT GAME HERE)',
            content: 'INSERT POKEMON DESCRIPTION HERE',
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: _SpeciesData(
                  title: 'Height',
                  content: '2\'4\'\' (0.71 m)',
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                flex: 1,
                child: _SpeciesData(
                  title: 'Height',
                  content: '15.21 lbs (6.9 kg)',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SpeciesData extends StatelessWidget {
  final String content;
  final String title;

  const _SpeciesData({this.content, this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8.0),
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black12,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            content,
            textAlign: TextAlign.center,
          ),
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black45),
        ),
      ],
    );
  }
}
