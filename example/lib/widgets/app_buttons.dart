import 'package:clean_framework_router/clean_framework_router.dart';
import 'package:example/routes.dart';
import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {

  final String title;

  const AppElevatedButton({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 200,
      child: ElevatedButton(
        onPressed: (){
          context.router.go(Routes.notifications);
        },
        child: Text(title),
      ),
    );
  }

}