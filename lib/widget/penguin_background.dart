import 'package:flutter/material.dart';

class PenguinBackground extends StatelessWidget {
  const PenguinBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/background_character/8b928ee2-1597-4449-9271-af8d08c1002a.webp',
      width: 300,
      fit: BoxFit.cover,
    );
  }
}
