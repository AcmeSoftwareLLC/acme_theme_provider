import 'package:flutter/material.dart';
import 'package:playground/components/snackbar.dart';

class PlayGroundSnackBar extends StatelessWidget {
  const PlayGroundSnackBar({Key? key}) : super(key: key);

  final snackBar = const FirstSnackBar(
    content: Text('Yay! A SnackBar!'),
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: OutlinedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          child: const Text('Show SnackBar')),
      // child: FirstSnackBar(
      //   content: Text('Yay! A SnackBar!'),
      // ),
    );
  }
}
