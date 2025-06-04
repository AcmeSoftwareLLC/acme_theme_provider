import 'package:flutter/material.dart';
import 'package:playground/components/snackbar.dart';

class PlayGroundSnackBar extends StatelessWidget {
  const PlayGroundSnackBar({super.key});

  @override
  Widget build(BuildContext context) {
    const content = Text('Yay! A SnackBar!');

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FirstSnackBar(
          animation: const AlwaysStoppedAnimation(1),
          content: content,
          action: SnackBarAction(
            label: 'CLICK ME',
            onPressed: () {},
          ),
        ),
        ElevatedButton(
          child: const Text('SHOW SNACK'),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const FirstSnackBar(content: content),
            );
          },
        )
      ],
    );
  }
}
