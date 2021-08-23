import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:poke_flutter/models/pokemon.dart';
import 'package:poke_flutter/providers/api_provider.dart';
import 'package:poke_flutter/tabs/info_tab.dart';
import 'package:poke_flutter/widgets/detail_header.dart';

class DetailPage extends StatelessWidget {
  static const PAGE_NAME = 'Detail';

  @override
  Widget build(BuildContext context) {
    final ApiProvider apiProvider = Provider.of<ApiProvider>(context);
    final Pokemon pokemon = apiProvider.selectedPokemon;

    return SafeArea(
      child: Scaffold(
        backgroundColor: pokemon.averageColor,
        body: Column(
          children: [
            DetailHeader(),
            Expanded(
              child: InfoTab(),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: pokemon.averageColor,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.black54,
          currentIndex: 0,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.info_outline),
              label: 'Info',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: 'Moves',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'More',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz),
              label: 'Menu',
            ),
          ],
        ),
      ),
    );
  }
}
