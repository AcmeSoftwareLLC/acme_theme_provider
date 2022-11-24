import 'package:flutter/material.dart';
import 'package:playground/components/text_field.dart';

class PlayGroundTextFields extends StatelessWidget {
  const PlayGroundTextFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          FirstTextField(),
          SecondTextField(),
        ],
      ),
    );
  }
}
