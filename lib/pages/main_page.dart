import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:poke_flutter/layout/custom_drawer.dart';
import 'package:poke_flutter/providers/providers.dart';

class MainPage extends StatelessWidget {
  static const PAGE_NAME = 'Main Page';

  @override
  Widget build(BuildContext context) {
    final DrawerProvider drawerProvider = Provider.of<DrawerProvider>(context);

    String title = drawerProvider.actualOption.toString();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: drawerProvider.actualOption,
      drawer: CustomDrawer(),
    );
  }
}
