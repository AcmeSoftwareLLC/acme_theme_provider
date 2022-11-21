import 'package:clean_framework_router/clean_framework_router.dart';
import 'package:example/routes.dart';
import 'package:flutter/material.dart';

class AddNoteButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () => context.router.go(Routes.note),
      label: Text(
        'Add Note',
      ),
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      icon: Icon(
        Icons.add,
      ),
    );
  }
}
