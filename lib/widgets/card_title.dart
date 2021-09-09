import 'package:flutter/material.dart';

class CardTitle extends StatelessWidget {
  final text;

  const CardTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 18,
      ),
    );
  }
}
