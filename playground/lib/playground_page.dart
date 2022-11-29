import 'package:flutter/material.dart';
import 'package:playground/widgets/playground_appbars.dart';
import 'package:playground/widgets/playground_buttons.dart';
import 'package:playground/widgets/playground_cards.dart';
import 'package:playground/widgets/playground_chips.dart';
import 'package:playground/widgets/playground_dropdown_buttons.dart';
import 'package:playground/widgets/playground_sliders.dart';
import 'package:playground/widgets/playground_text_fields.dart';

class PlaygroundPage extends StatelessWidget {
  const PlaygroundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Playground'),
          bottom: const TabBar(
            labelColor: Colors.black,
            isScrollable: true,
            tabs: [
              Tab(text: 'AppBars'),
              Tab(text: 'Buttons'),
              Tab(text: 'TextFields'),
              Tab(text: 'Cards'),
              Tab(text: 'DropdownButtons'),
              Tab(text: 'Sliders'),
              Tab(text: 'Chips'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            PlayGroundAppBars(),
            PlayGroundButtons(),
            PlayGroundTextFields(),
            PlayGroundCards(),
            PlayGroundDropdownButtons(),
            PlayGroundSliders(),
            PlayGroundChips(),
          ],
        ),
      ),
    );
  }
}
