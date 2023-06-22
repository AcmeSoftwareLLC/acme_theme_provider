import 'package:flutter/material.dart';
import 'package:playground/components/text_field.dart';

class PlayGroundTextFields extends StatelessWidget {
  const PlayGroundTextFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FirstTextField(),
          SecondTextField(),
        ],
      ),
    );
  }
}
