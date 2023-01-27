import 'package:clean_framework_router/clean_framework_router.dart';
import 'package:acme_theme_example/main.dart';
import 'package:acme_theme_example/routes.dart';
import 'package:acme_theme_example/widgets/app_buttons.dart';
import 'package:acme_theme_example/widgets/profile_icon.dart';
import 'package:flutter/material.dart';

class SettingsUI extends StatefulWidget {
  const SettingsUI({super.key});

  @override
  State<SettingsUI> createState() => _SettingsUIState();
}

class _SettingsUIState extends State<SettingsUI> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
      appBar: AppBar(
        title: Text('Settings',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.w800)),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
        leading: const ProfileIcon.small(
          imagePath:
              'https://xsgames.co/randomusers/assets/avatars/female/40.jpg',
        ),
        shape: Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.surfaceVariant,
            width: 0.5,
          ),
        ),
      ),
      body: Container(
        height: screenHeight / 2,
        color: Theme.of(context).colorScheme.surface,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 48,
              width: screenWidth,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.surfaceVariant,
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Text('Change current theme',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w900,
                        )),
              ),
            ),
            _ThemeSelectionTile(
              changeCurrentTheme: (theme) => ThemeScope.of(context)
                  .changeAsset('assets/themes/$theme.acme'),
            ),
            const SizedBox(height: 20),
            AppElevatedButton(
              title: 'Done',
              onPressed: () => context.router.push(
                Routes.home,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ThemeSelectionTile extends StatefulWidget {
  final ValueChanged<String> changeCurrentTheme;

  const _ThemeSelectionTile({
    required this.changeCurrentTheme,
  });

  @override
  State<_ThemeSelectionTile> createState() => _ThemeSelectionTileState();
}

class _ThemeSelectionTileState extends State<_ThemeSelectionTile> {
  int? _selectedIndex;
  final List<String> themePaths = [
    'blue-theme',
    'green-theme',
    'red-theme',
    'yellow-theme',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: themePaths.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(
                width: 0.5,
                color: Theme.of(context).colorScheme.surfaceVariant),
          ),
          child: ListTile(
            title: Text(themePaths[index]),
            selected: index == _selectedIndex,
            trailing: _selectedIndex == index
                ? const Icon(Icons.check)
                : const SizedBox.shrink(),
            onTap: () {
              _selectedIndex = index;
              widget.changeCurrentTheme(themePaths[index]);
              setState(() {});
            },
          ),
        );
      },
    );
  }
}
