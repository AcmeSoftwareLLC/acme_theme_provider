import 'package:flutter/material.dart';
import 'package:playground/components/slider.dart';

class PlayGroundSliders extends StatefulWidget {
  const PlayGroundSliders({super.key});

  @override
  State<PlayGroundSliders> createState() => _PlayGroundSlidersState();
}

class _PlayGroundSlidersState extends State<PlayGroundSliders> {
  var firstSliderValue = 0.0;
  var secondSliderValue = 0.0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FirstSlider(
            value: firstSliderValue,
            onChanged: (value) {
              setState(() {
                firstSliderValue = value;
              });
            },
          ),
          SecondSlider(
            value: secondSliderValue,
            onChanged: (value) {
              setState(() {
                secondSliderValue = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
