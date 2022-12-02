import 'package:clean_framework_router/clean_framework_router.dart';
import 'package:example/routes.dart';
import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {

  final String title;

  const AppElevatedButton({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height;
    final _screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 36,
      width: 136,
      child: ElevatedButton(
        onPressed: (){
          context.router.go(Routes.notifications);
        },
        child: Text(title, style: TextStyle(color: Colors.white),),
        style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).colorScheme.primary,),

      ),
    );
  }

}