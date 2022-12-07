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
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ImageIcon(
                  AssetImage(
                    'assets/icons/heart_solid_icon.png',
                  ),
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                SizedBox(
                  height: 10,
                ),
                ProfileIcon.large(
                  imagePath: userImage,
                ),
              ],
            ),
            SizedBox(
              width: 8,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    totalLike.isEven
                        ? 'Zack John liked'
                        : 'Richard Jones Liked',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            firstName + ' ' + lastName,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                            width: 80,
                            child: Text(
                              '@$userName',
                              style: Theme.of(context).textTheme.titleMedium,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '${time}h',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                      ImageIcon(
                        AssetImage(
                          'assets/icons/down_arrow_icon.png',
                        ),
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ],
                  ),
                  Text(
                    post,
                    style: Theme.of(context).textTheme.bodyMedium,
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
                            ImageIcon(
                              AssetImage(
                                'assets/icons/comment_stroke_icon.png',
                              ),
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                            ),
                            Text(
                              totalComment.toString(),
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            ImageIcon(
                              AssetImage(
                                'assets/icons/retweet_solid_stroke_icon.png',
                              ),
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                            ),
                            Text(
                              totalReTweet.toString(),
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            ImageIcon(
                              AssetImage(
                                'assets/icons/heart_stroke_icon.png',
                              ),
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                            ),
                            Text(
                              totalLike.toString(),
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                        ImageIcon(
                          AssetImage('assets/icons/share_stroke_icon.png'),
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Column(
                    children: [
                      totalReTweet.isOdd
                          ? Text(
                              'Show this thread',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                            )
                          : SizedBox(),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                  imagePath.isNotEmpty
                      ? Image.file(
                          File(imagePath),
                          height: screenHeight / 3.2,
                          fit: BoxFit.contain,
                        )
                      : SizedBox(),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Divider(
          thickness: 0.5,
          color: Theme.of(context).colorScheme.outline,
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
