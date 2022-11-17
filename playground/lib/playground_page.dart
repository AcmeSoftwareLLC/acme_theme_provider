import 'package:flutter/material.dart';

import 'components/one_app_bar.dart';
import 'components/two_app_bar.dart';

class PlaygroundPage extends StatelessWidget {
  const PlaygroundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Playground'),
      ),
      body: Padding(
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
      ),
    );
  }
}
