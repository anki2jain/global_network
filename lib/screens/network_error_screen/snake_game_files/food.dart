import 'package:flutter/material.dart';

class Food extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20.0,
      height: 20.0,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 0.5, color: Colors.yellowAccent),
          color: Colors.indigoAccent[700]),
    );
  }
}
