import 'package:example/features/home/presentation/home_ui.dart';
import 'package:example/ui/message_ui.dart';
import 'package:example/ui/notifications_ui.dart';
import 'package:example/ui/search_ui.dart';
import 'package:example/widgets/app_icons.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    HomeUI(),
    const SearchUI(),
    const NotificationsUI(),
    const MessageUI(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: AppIcons(
              iconPath: 'assets/icons/home_icon.png',
              color: Theme.of(context).colorScheme.secondaryContainer,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: AppIcons(
              iconPath: 'assets/icons/search_stroke_icon.png',
              color: Theme.of(context).colorScheme.secondaryContainer,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: AppIcons(
              iconPath: 'assets/icons/bell_stroke_icon.png',
              color: Theme.of(context).colorScheme.secondaryContainer,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: AppIcons(
              iconPath: 'assets/icons/message_stroke_icon.png',
              color: Theme.of(context).colorScheme.secondaryContainer,
            ),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.outline,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
      ),
    );
  }
}
