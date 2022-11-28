import 'package:flutter/material.dart';
import 'package:playground/components/one_app_bar.dart';
import 'package:playground/components/two_app_bar.dart';

class PlayGroundAppBars extends StatelessWidget {
  const PlayGroundAppBars({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const Spacer(),
            Expanded(
              child: Scaffold(
                primary: false,
                appBar: OneAppBar(
                  title: const Text('One App Bar'),
                  leading: const Icon(Icons.menu),
                  bottom: const TabBar(
                    tabs: [
                      Tab(text: 'Tab 1'),
                      Tab(text: 'Tab 2'),
                      Tab(text: 'Tab 3'),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Scaffold(
                primary: false,
                appBar: TwoAppBar(
                  title: const Text('Two App Bar'),
                  leading: const Icon(Icons.home),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
