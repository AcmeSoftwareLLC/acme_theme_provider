import 'dart:io';
import 'package:flutter/material.dart';

class UploadImage extends StatelessWidget {
  const UploadImage({
    super.key,
    required this.imagePath,
    required this.onOpenGallery,
  });

  final String imagePath;
  final VoidCallback onOpenGallery;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).colorScheme.surfaceVariant,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (imagePath.isNotEmpty)
              Image.file(
                File(imagePath),
                height: 300,
                width: 500,
                fit: BoxFit.fill,
              )
            else
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.photo),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Please provide the image',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                  ),
                ],
              ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: onOpenGallery,
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Theme.of(context).colorScheme.surface,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.camera_alt,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      imagePath.isEmpty ? 'Open gallery' : 'Change image',
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
