import 'package:clean_framework_router/clean_framework_router.dart';
import 'package:example/routes.dart';
import 'package:flutter/material.dart';

class AddTweetButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () => context.router.push(Routes.addTweet),
      label: Text(
        'Add Tweet',
      ),
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      icon: Icon(
        Icons.add,
      ),
    );
  }
}
