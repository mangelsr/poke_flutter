import 'package:flutter/material.dart';

class TypeBadge extends StatelessWidget {
  final text;

  const TypeBadge(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
          // color: Color.fromRGBO(255, 255, 255, 0.5),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          border: Border.all(
            color: Colors.black12,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
