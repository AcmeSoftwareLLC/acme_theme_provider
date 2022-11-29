import 'package:example/widgets/profile_icon.dart';
import 'package:example/widgets/profile_picture.dart';
import 'package:flutter/material.dart';

class NotificationsUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('Notifications'),
          centerTitle: true,
          leading: ProfileIcon(),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.settings),
            )
          ],
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'All',
              ),
              Tab(
                text: 'Mentions',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemBuilder: (context, index) {
                return _NotificationCard();
              },
              itemCount: 10,
            ),
            Icon(Icons.directions_transit),
          ],
        ),
      ),
      length: 2,
    );
  }
}

class _NotificationCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height;
    final _screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: _screenHeight/1.5,
      padding: EdgeInsets.only(left: 42),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.ac_unit),
              ProfilePicture(),
              SizedBox(
                width: _screenWidth / 2,
              ),
              Icon(Icons.arrow_downward),
              SizedBox(
                width: _screenWidth / 20,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 42.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
