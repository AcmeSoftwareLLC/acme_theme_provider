import 'package:flutter/material.dart';
import 'package:playground/components/button.dart';

import 'components/one_app_bar.dart';
import 'components/two_app_bar.dart';

class PlaygroundPage extends StatelessWidget {
  const PlaygroundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Playground'),
          bottom: const TabBar(
            labelColor: Colors.black,
            tabs: [
              Tab(text: 'App Bars'),
              Tab(text: 'Buttons'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            PlayGroundAppBars(),
            PlayGroundButtons(),
          ],
        ),
      ),
    );
  }
}

class PlayGroundAppBars extends StatelessWidget {
  const PlayGroundAppBars({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          SizedBox(
            height: 100,
            child: OneAppBar(
              title: Text('One App Bar'),
              leading: Icon(Icons.menu),
            ),
          ),
          TwoAppBar(
            title: Text('Two App Bar'),
            leading: Icon(Icons.menu),
          ),
        ],
      ),
    );
  }
}

class PlayGroundButtons extends StatelessWidget {
  const PlayGroundButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AcmeOutlinedButton(
            child: const Text('Outlined Button'),
            onPressed: () {},
          ),
          AcmeElevatedButton(
            child: const Text('Elevated Button'),
            onPressed: () {},
          ),
          AcmeTextButton(
            child: const Text('Text Button'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
