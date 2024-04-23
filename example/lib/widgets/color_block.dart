import 'package:flutter/material.dart';

class ColorBlock extends StatelessWidget {
  const ColorBlock({
    super.key,
    required this.name,
    required this.color,
    required this.foregroundColor,
  });

  final String name;
  final Color color;
  final Color foregroundColor;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: color),
      child: Center(
        child: Text(
          name,
          style: TextStyle(color: foregroundColor),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
