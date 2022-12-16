import 'package:example/main.dart';
import 'package:flutter/material.dart';

class AppIcons extends StatelessWidget {
  final String iconPath;
  final Color color;

  const AppIcons({
    super.key,
    required this.iconPath,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SampleAppListenerScope.of(context).isOnThemeBuilder
        ? ImageIcon(
            AssetImage(
              iconPath,
              package: 'example',
            ),
            color: color,
          )
        : ImageIcon(
            AssetImage(
              iconPath,
            ),
            color: color,
          );
  }
}
