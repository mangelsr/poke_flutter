import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:poke_flutter/providers/providers.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DrawerProvider drawerProvider = Provider.of<DrawerProvider>(context);

    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Center(
              child: Text(
                'POKE FLUTTER',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
          ),
          ...drawerProvider.options.asMap().entries.map((entry) {
            int idx = entry.key;
            Widget widget = entry.value;
            return ListTile(
              title: Text(widget.toStringShort()),
              onTap: () {
                drawerProvider.changeOption(idx);
                Navigator.of(context).pop();
              },
            );
          }).toList(),
        ],
      ),
    );
  }
}
