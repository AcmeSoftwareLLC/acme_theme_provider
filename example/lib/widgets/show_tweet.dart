import 'dart:io';
import 'dart:math';
import 'package:acme_theme_example/widgets/app_icons.dart';
import 'package:acme_theme_example/widgets/profile_icon.dart';
import 'package:flutter/material.dart';

class ShowTweet extends StatelessWidget {
  const ShowTweet({
    super.key,
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
                AppIcons(
                  iconPath: 'assets/icons/heart_solid_icon.png',
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                const SizedBox(
                  height: 10,
                ),
                ProfileIcon.large(
                  imagePath: userImage,
                ),
              ],
            ),
            const SizedBox(
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
                            '$firstName $lastName',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
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
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            '${time}h',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                      AppIcons(
                        iconPath: 'assets/icons/down_arrow_icon.png',
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ],
                  ),
                  Text(
                    post,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 65),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            AppIcons(
                              iconPath: 'assets/icons/comment_stroke_icon.png',
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
                            AppIcons(
                              iconPath:
                                  'assets/icons/retweet_solid_stroke_icon.png',
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
                            AppIcons(
                              iconPath: 'assets/icons/heart_stroke_icon.png',
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
                        AppIcons(
                          iconPath: 'assets/icons/share_stroke_icon.png',
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
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
                          : const SizedBox(),
                      const SizedBox(
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
                      : const SizedBox(),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Divider(
          thickness: 0.2,
          color: Theme.of(context).colorScheme.outline,
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
