import 'package:flutter/material.dart';

void showErrorSnackBar(BuildContext context, String content) {
  final snackBar = SnackBar(
    content: Text(
      content,
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

Future<void> showOKDialog({
  required BuildContext context,
  required String title,
  required String content,
  required VoidCallback onOk,
}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                content,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: onOk,
            child: Text(
              'OK',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
        ],
      );
    },
  );
}
