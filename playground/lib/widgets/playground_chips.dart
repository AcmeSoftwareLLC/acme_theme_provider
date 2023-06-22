import 'package:flutter/material.dart';
import 'package:playground/components/chip.dart';

class PlayGroundChips extends StatelessWidget {
  const PlayGroundChips({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FirstChip(
            label: Text('Lorem ipsum'),
          ),
          SecondChip(
            label: Text('Non vero'),
          ),
        ],
      ),
    );
  }
}
