import 'package:example/widgets/profile_icon.dart';
import 'package:flutter/material.dart';

class NotificationsUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('Notifications', style: Theme.of(context).textTheme.titleMedium),
          centerTitle: true,
          leading: ProfileIcon.small(imagePath: 'https://xsgames.co/randomusers/assets/avatars/female/40.jpg',),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ImageIcon(AssetImage('assets/icons/settings_stroke_icon.png'), color: Theme.of(context).colorScheme.primary),
            )
          ],
          bottom: PreferredSize(
            child: TabBar(
              tabs: [
                Tab(
                  text: 'All',
                ),
                Tab(
                  text: 'Mentions',
                ),
              ],
              labelColor: Theme.of(context).colorScheme.primary,
              unselectedLabelColor: Theme.of(context).colorScheme.outline,
              indicatorColor: Theme.of(context).colorScheme.primary,

            ),
            preferredSize: Size.fromHeight(50),
          ),
        ),
        body: TabBarView(
          children: [
            _AllNotificationsUI(),
            _MentionsUI(),
          ],
        ),
      ),
      length: 2,
    );
  }
}

class _AllNotificationsUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
    final _screenHeight = MediaQuery.of(context).size.height;
    final _screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: _screenHeight / 4,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1, color: Theme.of(context).colorScheme.surfaceVariant),),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 32, top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ImageIcon(AssetImage('assets/icons/star_solid_icon.png'), color: Colors.purpleAccent,),
                ProfileIcon.medium(imagePath: index.isEven? 'https://xsgames.co/randomusers/assets/avatars/male/$index.jpg' :'https://xsgames.co/randomusers/assets/avatars/female/$index.jpg',),
                SizedBox(
                  width: _screenWidth / 2,
                ),
                Icon(Icons.keyboard_arrow_down),
                SizedBox(
                  width: _screenWidth / 80,
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
                Text('In case you missed Saad Drusteer\'s Tweet'),
                Text(
                    'Are you using WordPress and migrating to the JAMstack? I wrote up a case study about how the Smashing magazine moved to JAMstack and saw great performance improvements and better security'),
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

  const _MentionsCard({required this.index});

  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height;
    final _screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: _screenHeight / 2,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1, color: Theme.of(context).colorScheme.surfaceVariant),),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ProfileIcon.medium(imagePath: index.isOdd? 'https://xsgames.co/randomusers/assets/avatars/male/$index.jpg' :'https://xsgames.co/randomusers/assets/avatars/female/$index.jpg',),
                Text('Mariane'),
                SizedBox(width: 20,),
                Text('1/21/20'),
                SizedBox(
                  width: _screenWidth / 2.5,
                ),
                Icon(Icons.keyboard_arrow_down),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 64, right: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hey\n@user'),
                Text('Mariane mentioned you in a post'),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).colorScheme.surfaceVariant),
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
                          height: _screenHeight / 6,
                          width: _screenWidth,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Top users of the month'),
                        ),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.comment),
                      Icon(Icons.repeat),
                      Icon(Icons.favorite),
                      Icon(Icons.file_upload_outlined),
                      SizedBox(width: 10,)
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
