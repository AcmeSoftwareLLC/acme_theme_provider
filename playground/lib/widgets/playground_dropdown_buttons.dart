import 'package:flutter/material.dart';
import 'package:playground/components/dropdown_button.dart';

class PlayGroundDropdownButtons extends StatefulWidget {
  const PlayGroundDropdownButtons({super.key});

  @override
  State<PlayGroundDropdownButtons> createState() =>
      _PlayGroundDropdownButtonsState();
}

class _PlayGroundDropdownButtonsState extends State<PlayGroundDropdownButtons> {
  String? _value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const FirstDropdownButton(
            hint: Text('Disabled Test'),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: SecondDropdownButton(
              hint: const Text('Dropdown Test'),
              value: _value,
              items: [
                for (final item in ['One', 'Two', 'Three'])
                  DropdownMenuItem(value: item, child: Text(item)),
              ],
              onChanged: (value) {
                _value = value;
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }
}
