import 'package:flutter/material.dart';
import 'package:playground/components/dropdown_button.dart';

class PlayGroundDropdownButtons extends StatelessWidget {
  const PlayGroundDropdownButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          FirstDropdownButton(
            hint: Text('Disabled Test'),
          ),
          SecondDropdownButton(
            hint: Text('Dropdown Test'),
          ),
        ],
      ),
    );
  }
}
