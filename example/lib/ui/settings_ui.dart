import 'package:clean_framework_router/clean_framework_router.dart';
import 'package:example/main.dart';
import 'package:example/widgets/app_buttons.dart';
import 'package:example/widgets/profile_icon.dart';
import 'package:flutter/material.dart';

class SettingsUI extends StatefulWidget {
  @override
  State<SettingsUI> createState() => _SettingsUIState();
}

class _SettingsUIState extends State<SettingsUI> {

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    final _screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
      appBar: AppBar(
        title: Text('Settings', style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w800)),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
        leading: ProfileIcon.small(
          imagePath:
              'https://xsgames.co/randomusers/assets/avatars/female/40.jpg',
        ),
        shape: Border(
            bottom: BorderSide(
              color: Theme.of(context).colorScheme.surfaceVariant,
              width: 0.5,
            )
        ),
      ),
      body: Container(
        height: _screenHeight/2,
        color: Theme.of(context).colorScheme.surface,
        child: Column(
         mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 48,
              width: _screenWidth,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Text('Change current theme', style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w900, )),
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).colorScheme.surfaceVariant,),
              ),
            ),

            _ThemeSelectionTile(
              changeCurrentTheme: (theme) =>
                  ThemeScope.of(context).changeAsset('assets/themes/$theme.acme'),
            ),
            SizedBox(height: 20),
            AppElevatedButton(
              title: 'Done', onPressed: ( ) => context.router.pop()
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
            border: Border.all(width: 0.5, color: Theme.of(context).colorScheme.surfaceVariant),
          ),
          padding: EdgeInsets.all(8),
          child: ListTile(
            title: Text(themePaths[index]),
            selected: index == _selectedIndex,
            trailing: _selectedIndex == index ? Icon(Icons.check) : SizedBox.shrink(),
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
