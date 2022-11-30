import 'dart:io';
import 'dart:math';
import 'package:example/widgets/profile_icon.dart';
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
    var totalComment = Random().nextInt(200);
    var totalReTweet = Random().nextInt(200);
    var totalLike = Random().nextInt(200);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ProfileIcon.large(imagePath: userImage),
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
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(fontSize: 16),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        lastName,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(fontSize: 16),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '@$userName',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: 14),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${time}h',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontSize: 12,
                                ),
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
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 65),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.mode_comment_outlined,
                            ),
                            Text(
                              totalComment.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    fontSize: 12,
                                  ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.refresh,
                            ),
                            Text(
                              totalReTweet.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    fontSize: 12,
                                  ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.favorite_border,
                            ),
                            Text(
                              totalLike.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    fontSize: 12,
                                  ),
                            ),
                          ],
                        ),
                        Icon(Icons.file_upload_outlined),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Show this thread',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 15,
                        ),
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
