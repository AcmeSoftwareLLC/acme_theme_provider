import 'package:flutter/material.dart';

class ProfileIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 10,
        width: 10,
        child: Icon(Icons.add_card_outlined,),
        decoration: BoxDecoration(
            color: Colors.orange,
            shape: BoxShape.circle
        ),
      ),
    );
  }

}