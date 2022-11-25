import 'dart:io';

import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  const NoteCard._({
    required this.title,
    required this.content,
    required this.imagePath,
  });

  final String title;
  final String content;
  final String imagePath;

  factory NoteCard.surface({
    required String title,
    required String content,
    required String imagePath,
  }) = NoteCardSquared._;

  factory NoteCard.surfaceVariant({
    required String title,
    required String content,
    required String imagePath,
  }) = NoteCardRectangular._;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20.0,
      color: Theme.of(context).colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.file(
              File(imagePath),
              fit: BoxFit.cover,
            ),
            Text(
              title,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              content,
              overflow: TextOverflow.ellipsis,
            ),
            Expanded(child: SizedBox(height: 10,)),
          ],
        ),
      ),
    );
  }
}

class NoteCardSquared extends NoteCard {
  NoteCardSquared._(
      {required super.title, required super.content, required super.imagePath})
      : super._();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final squareCardHeight = screenHeight / 1.5;
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
          height: squareCardHeight / 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.file(
                File(imagePath),
                height: squareCardHeight / 4,
                width: screenWidth,
                fit: BoxFit.cover,
              ),
              Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.left,
              ),
              Text(
                content,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.left,
              ),
              Expanded(
                  child: SizedBox(
                height: 10,
              )),
            ],
          )),
    );
  }
}

class NoteCardRectangular extends NoteCard {
  NoteCardRectangular._(
      {required super.title, required super.content, required super.imagePath})
      : super._();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final rectangularCardHeight = screenHeight / 1.5;
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
      child: SizedBox(
          height: rectangularCardHeight /2 ,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.file(
                File(imagePath),
                height: rectangularCardHeight / 4,
                width: screenWidth,
                fit: BoxFit.cover,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.right,
              ),
              Text(
                content,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.right,
              ),
              Expanded(
                  child: SizedBox(
                height: 10,
              )),
            ],
          )),
    );
  }
}
