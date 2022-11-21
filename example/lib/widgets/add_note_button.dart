import 'package:flutter/material.dart';

class AddNoteButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(onPressed: () {}, label: Text('Add Note'), backgroundColor: Theme.of(context).colorScheme.primaryContainer, icon: Icon(Icons.add,), );
  }
}
