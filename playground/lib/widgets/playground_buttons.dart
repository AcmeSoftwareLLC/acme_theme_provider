import 'package:flutter/material.dart';
import 'package:playground/components/button.dart';

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
