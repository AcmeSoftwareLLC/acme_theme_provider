import 'package:clean_framework_router/clean_framework_router.dart';
import 'package:example/routes.dart';
import 'package:flutter/material.dart';

class AddTweetButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => context.router.push(Routes.addTweet),
      child: Icon(
        Icons.add,
      ),
    );
  }
}
