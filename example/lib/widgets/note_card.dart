import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  const NoteCard._({
    required this.title,
    required this.content,
  });

  final String title;
  final String content;

  factory NoteCard.squared(
      {required String title,
      required String content,
      }) = NoteCardSquared._;

  factory NoteCard.rectangular(
      {required String title,
      required String content,
      }) = NoteCardRectangular._;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20.0,
      color: Colors.green,
      child: Text(title, overflow: TextOverflow.ellipsis,),
    );
  }
}

class NoteCardSquared extends NoteCard {
  NoteCardSquared._(
      {required super.title, required super.content,})
      : super._();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final squareCardHeight = screenHeight / 4;
    final squareCardBorderShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    );
    return Card(
      elevation: 20.0,
      shape: squareCardBorderShape,
      color: Theme.of(context).colorScheme.surface,
      shadowColor: Theme.of(context).colorScheme.shadow,
      surfaceTintColor: Theme.of(context).colorScheme.surfaceTint,
      child: SizedBox(
          height: squareCardHeight,
          width: screenWidth/2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.left,),
          )),
    );
  }
}

class NoteCardRectangular extends NoteCard {
  NoteCardRectangular._(
      {required super.title, required super.content,})
      : super._();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final rectangularCardHeight = screenHeight / 2.5;
    final rectangularCardBorderShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        12,
      ),
      side: BorderSide(
        color: Theme.of(context).colorScheme.outline,
      ),
    );

    return Card(
      elevation: 0,
      shape: rectangularCardBorderShape,
      color: Theme.of(context).colorScheme.surfaceVariant,
      shadowColor: Theme.of(context).colorScheme.shadow,
      surfaceTintColor: Theme.of(context).colorScheme.surfaceTint,
      child: SizedBox(height: rectangularCardHeight, child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(title, style: Theme.of(context).textTheme.headlineMedium, overflow: TextOverflow.ellipsis, textAlign: TextAlign.right,),
      )),
    );
  }
}
