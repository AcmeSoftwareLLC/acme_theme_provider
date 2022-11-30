import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';

class ShowTweet extends StatelessWidget {
  const ShowTweet({
    required this.post,
    required this.imagePath,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.userImage,
  });

  final String post;
  final String imagePath;
  final String firstName;
  final String lastName;
  final String userName;
  final String userImage;

  @override
  Widget build(BuildContext context) {
    var time = Random().nextInt(24);
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(userImage),
            ),
            SizedBox(
              width: 8,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        firstName,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        lastName,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '@$userName',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${time}h',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    post,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        imagePath.isNotEmpty
            ? Image.file(
                File(imagePath),
                height: 300,
                width: 500,
                fit: BoxFit.fill,
              )
            : SizedBox(),
        SizedBox(
          height: 10,
        ),
        Divider(
          height: 5,
          thickness: 2,
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
