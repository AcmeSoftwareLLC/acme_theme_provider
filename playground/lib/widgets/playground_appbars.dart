import 'package:flutter/material.dart';
import 'package:playground/components/one_app_bar.dart';
import 'package:playground/components/two_app_bar.dart';

class PlayGroundAppBars extends StatelessWidget {
  const PlayGroundAppBars({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
