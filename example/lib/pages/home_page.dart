import 'package:acme_theme_example/earth_colors.dart';
import 'package:acme_theme_example/widgets/color_row.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Colors'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const SizedBox(height: 16),
          for (final color in EarthColors.of(context).colors.values)
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: ColorRow(color: color),
            ),
        ],
      ),
    );
  }
}
