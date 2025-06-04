import 'package:flutter/material.dart';
import 'package:playground/components/dialog.dart';

class PlayGroundDialogs extends StatelessWidget {
  const PlayGroundDialogs({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => const Padding(
            padding: EdgeInsets.all(16.0),
            child: FirstDialog(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Lorem ipsum dolor sit amet. 33 aperiam rerum vel sint veniam nam dolor placeat! Aut quis sint aut repellat dolorum 33 minus accusamus.',
                ),
              ),
            ),
          ),
        );
      },
      child: const Text('Show Dialog'),
    );
  }
}
