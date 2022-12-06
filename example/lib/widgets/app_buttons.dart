import 'package:clean_framework_router/clean_framework_router.dart';
import 'package:example/routes.dart';
import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {

  final String title;
  final VoidCallback onPressed;

  const AppElevatedButton({super.key, required this.title, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      width: 136,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(title, style: Theme.of(context).textTheme.button!.copyWith(color: Theme.of(context).colorScheme.background,)),
        style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).colorScheme.primary,),
      ),
    );
  }

}