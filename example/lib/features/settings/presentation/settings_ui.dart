import 'package:example/main.dart';
import 'package:flutter/material.dart';

class SettingsUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     String selectedThemeName;
    final List<String> themePaths = [
      'assets/themes/blue-theme.acme',
      'assets/themes/green-theme.acme',
      'assets/themes/red-theme.acme',
      'assets/themes/yellow-theme.acme',
    ];
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            ThemeSelector(
              selectedThemeName: 'currentTheme.name',
              themeNames: themePaths,
              changeCurrentTheme: (theme) {
                ThemeScope.of(context)
                    .changeAsset('assets/themes/yellow-theme.acme');
                selectedThemeName = theme.toString();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ThemeSelector extends StatelessWidget {
  const ThemeSelector({
    super.key,
    required this.selectedThemeName,
    required this.themeNames,
    required this.changeCurrentTheme,
  });

  final String selectedThemeName;
  final Iterable<String> themeNames;
  final ValueChanged<String> changeCurrentTheme;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextButton.icon(
        onPressed: () {
          final button = context.findRenderObject()! as RenderBox;
          final overlay = Navigator.of(context)
              .overlay!
              .context
              .findRenderObject()! as RenderBox;

          final offset = Offset(
            button.size.width - 30,
            button.size.height + 4,
          );

          final position = RelativeRect.fromRect(
            Rect.fromPoints(
              button.localToGlobal(offset, ancestor: overlay),
              button.localToGlobal(
                button.size.bottomLeft(Offset.zero) + offset,
                ancestor: overlay,
              ),
            ),
            Offset.zero & overlay.size,
          );

          final itemStyle = Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Theme.of(context).colorScheme.surfaceTint,
              );

          showMenu(
            context: context,
            position: position,
            elevation: 4,
            color: Theme.of(context).colorScheme.onInverseSurface,
            items: <PopupMenuEntry<Object>>[
              for (final themeName in themeNames)
                PopupMenuItem(
                  child: Text(themeName, style: itemStyle),
                  onTap: () => changeCurrentTheme(themeName),
                ),
              const PopupMenuDivider(),
            ],
          );
        },
        label: Text(selectedThemeName),
        icon: const Icon(Icons.keyboard_arrow_down),
        style: TextButton.styleFrom(
          textStyle: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
