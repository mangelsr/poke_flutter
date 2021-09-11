import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:poke_flutter/models/pokemon.dart';
import 'package:poke_flutter/providers/providers.dart';
import 'package:poke_flutter/tabs/tabs.dart';
import 'package:poke_flutter/widgets/detail_header.dart';

class DetailPage extends StatelessWidget {
  static const PAGE_NAME = 'Detail';

  @override
  Widget build(BuildContext context) {
    final ApiProvider apiProvider = Provider.of<ApiProvider>(context);
    final NavigationProvider navigationProvider =
        Provider.of<NavigationProvider>(context);

    final Pokemon pokemon = apiProvider.selectedPokemon;

    final List<Widget> tabs = [
      InfoTab(),
      MovesTab(),
      MoreTab(),
      MenuTab(),
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: pokemon.averageColor,
        body: Column(
          children: [
            DetailHeader(),
            Expanded(
              child: tabs[navigationProvider.selectedTab],
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: pokemon.averageColor,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.black54,
          currentIndex: navigationProvider.selectedTab,
          onTap: navigationProvider.changeTab,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.info_outline),
              label: navigationProvider.selectedTab == 0 ? 'Info' : '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: navigationProvider.selectedTab == 1 ? 'Moves' : '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: navigationProvider.selectedTab == 2 ? 'More' : '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz),
              label: navigationProvider.selectedTab == 3 ? 'Menu' : '',
            ),
          ],
        ),
      ),
    );
  }
}
