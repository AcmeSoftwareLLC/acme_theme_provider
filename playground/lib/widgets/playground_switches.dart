import 'package:flutter/material.dart';
import 'package:playground/components/switch.dart';

class PlayGroundSwitches extends StatefulWidget {
  const PlayGroundSwitches({Key? key}) : super(key: key);

  @override
  State<PlayGroundSwitches> createState() => _PlayGroundSwitchesState();
}

class _PlayGroundSwitchesState extends State<PlayGroundSwitches> {
  var firstSwitchValue = true;
  var secondSwitchValue = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FirstSwitch(
            value: firstSwitchValue,
            onChanged: (value) {
              setState(() {
                firstSwitchValue = value;
              });
            },
          ),
          SecondSwitch(
            value: secondSwitchValue,
            onChanged: (value) {
              setState(() {
                secondSwitchValue = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
