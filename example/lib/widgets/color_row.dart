import 'package:acme_theme/acme_theme.dart';
import 'package:acme_theme_example/widgets/color_block.dart';
import 'package:flutter/material.dart';

class ColorRow extends StatelessWidget {
  const ColorRow({super.key, required this.color});

  final CustomColor color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ColorBlock(
              name: color.name,
              color: color.color,
              foregroundColor: color.onColor,
            ),
          ),
          Expanded(
            child: ColorBlock(
              name: 'On Color',
              color: color.onColor,
              foregroundColor: color.color,
            ),
          ),
          Expanded(
            child: ColorBlock(
              name: 'Container',
              color: color.colorContainer,
              foregroundColor: color.onColorContainer,
            ),
          ),
          Expanded(
            child: ColorBlock(
              name: 'On Color Container',
              color: color.onColorContainer,
              foregroundColor: color.colorContainer,
            ),
          ),
        ],
      ),
    );
  }
}
