import 'package:flutter/material.dart';
import 'package:playground/components/card.dart';

class PlayGroundCards extends StatelessWidget {
  const PlayGroundCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          FirstCard(),
          SecondCard(),
        ],
      ),
    );
  }
}
