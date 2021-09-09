import 'package:flutter/material.dart';

class LocationsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 8,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          'No locations found for this game version',
          style: TextStyle(
            color: Colors.black45,
          ),
        ),
      ),
    );
  }
}
