import 'package:example/widgets/app_icons.dart';
import 'package:example/widgets/profile_icon.dart';
import 'package:flutter/material.dart';

class NotificationsUI extends StatelessWidget {
  const NotificationsUI({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.surface,
          title: Text(
            'Notifications',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.w800),
          ),
          centerTitle: true,
          leading: const ProfileIcon.small(
            imagePath:
                'https://xsgames.co/randomusers/assets/avatars/female/40.jpg',
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: TabBar(
              tabs: const [
                Tab(
                  text: 'All',
                ),
                Tab(
                  text: 'Mentions',
                ),
              ],
              labelColor: Theme.of(context).colorScheme.primary,
              labelStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
              unselectedLabelStyle:
                  Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
              unselectedLabelColor: Theme.of(context).colorScheme.outline,
              indicatorColor: Theme.of(context).colorScheme.primary,
            ),
          ),
          shape: Border(
              bottom: BorderSide(
            color: Theme.of(context).colorScheme.surfaceVariant,
            width: 1,
          )),
        ),
        body: TabBarView(
          children: [
            _AllNotificationsUI(),
            _MentionsUI(),
          ],
        ),
      ),
    );
  }
}

class _AllNotificationsUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return _NotificationCard(index: index);
      },
      itemCount: 10,
    );
  }
}

class _NotificationCard extends StatelessWidget {
  final int index;

  const _NotificationCard({required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Theme.of(context).colorScheme.surfaceVariant,
          ),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 32, top: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    AppIcons(
                      iconPath: 'assets/icons/star_solid_icon.png',
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    ProfileIcon.medium(
                      imagePath: index.isEven
                          ? 'https://xsgames.co/randomusers/assets/avatars/male/$index.jpg'
                          : 'https://xsgames.co/randomusers/assets/avatars/female/$index.jpg',
                    ),
                  ],
                ),
                AppIcons(
                  iconPath: 'assets/icons/down_arrow_icon.png',
                  color: Theme.of(context).colorScheme.surfaceVariant,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 72, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'In case you missed Saad Drusteer\'s Tweet',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant),
                ),
                Text(
                  'Are you using WordPress and migrating to the JAMstack? I wrote up a case study about how the Smashing magazine moved to JAMstack and saw great performance improvements and better security',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w400,
                      ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'smashingdrusteer.com/2020/01/migrat...',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Theme.of(context).colorScheme.outline),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MentionsUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return _MentionsCard(
          index: index,
        );
      },
      itemCount: 10,
    );
  }
}

class _MentionsCard extends StatelessWidget {
  final int index;

  const _MentionsCard({
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
              width: 1, color: Theme.of(context).colorScheme.surfaceVariant),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ProfileIcon.medium(
                    imagePath: index.isOdd
                        ? 'https://xsgames.co/randomusers/assets/avatars/male/$index.jpg'
                        : 'https://xsgames.co/randomusers/assets/avatars/female/$index.jpg',
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Mariane',
                                style: Theme.of(context).textTheme.titleMedium),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              '@mariane',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .outline),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              '1/21/20',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .outline),
                            ),
                          ],
                        ),
                        Text(
                          'Hey',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground),
                        ),
                        Text(
                          '@theflaticon @iconmonstr @pixsellz @dan ielbruce_ @romanshamin @_vect_ @glyphish !',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                        Text(
                          'Check out our new article "Top Users of the month"',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                fontWeight: FontWeight.w400,
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                              ),
                        ),
                        Text(
                          'marianee.com/blog/top-users...',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color:
                                  Theme.of(context).colorScheme.surfaceVariant,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                  index.isEven
                                      ? 'https://xsgames.co/randomusers/assets/avatars/male/$index.jpg'
                                      : 'https://xsgames.co/randomusers/assets/avatars/female/$index.jpg',
                                  height: screenHeight / 6,
                                  width: screenWidth,
                                  fit: BoxFit.cover,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Top users of the month',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onBackground,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  AppIcons(
                                    iconPath:
                                        'assets/icons/comment_stroke_icon.png',
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground,
                                  ),
                                  const Text('7'),
                                ],
                              ),
                              Row(
                                children: [
                                  AppIcons(
                                    iconPath:
                                        'assets/icons/retweet_solid_stroke_icon.png',
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                  const Text('1'),
                                ],
                              ),
                              Row(
                                children: [
                                  AppIcons(
                                    iconPath:
                                        'assets/icons/heart_solid_icon.png',
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                  const Text('3'),
                                ],
                              ),
                              AppIcons(
                                iconPath: 'assets/icons/share_stroke_icon.png',
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurfaceVariant,
                              ),
                              const SizedBox(
                                width: 10,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            AppIcons(
              iconPath: 'assets/icons/down_arrow_icon.png',
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ],
        ),
      ),
    );
  }
}
