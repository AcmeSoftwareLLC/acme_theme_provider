import 'package:flutter/material.dart';
import 'package:playground/widgets/playground_appbars.dart';
import 'package:playground/widgets/playground_buttons.dart';
import 'package:playground/widgets/playground_text_fields.dart';

class PlaygroundPage extends StatelessWidget {
  const PlaygroundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Playground'),
          bottom: const TabBar(
            labelColor: Colors.black,
            tabs: [
              Tab(text: 'App Bars'),
              Tab(text: 'Buttons'),
              Tab(text: 'Text Fields'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            PlayGroundAppBars(),
            PlayGroundButtons(),
            PlayGroundTextFields(),
          ],
        ),
      ),
    );
  }
}
