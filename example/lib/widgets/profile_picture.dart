import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        width: 50,
        child: Icon(Icons.add_card_outlined,),
        decoration: BoxDecoration(
            color: Colors.orange,
            shape: BoxShape.circle
        ),
      ),
    );
  }

}