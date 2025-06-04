import 'package:flutter/material.dart';
import 'package:playground/components/alert_dialog.dart';

class PlayGroundAlertDialogs extends StatelessWidget {
  const PlayGroundAlertDialogs({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: OutlinedButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => const FirstAlertDialog(
              title: Text('Lorem ipsum dolor sit amet.'),
              content: Text(
                  'Lorem ipsum dolor sit amet. 33 aperiam rerum vel sint veniam nam dolor placeat! Aut quis sint aut repellat dolorum 33 minus accusamus.'),
            ),
          );
        },
        child: const Text('Show Alert Dialog'),
      ),
    );
  }
}
