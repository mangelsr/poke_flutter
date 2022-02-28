import 'package:flutter/material.dart';

class MoveListPage extends StatelessWidget {
  static const PAGE_NAME = 'Move List';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('MOVE LIST PAGE'),
      ),
    );
  }

  @override
  String toStringShort() {
    return 'Move Dex';
  }
}
