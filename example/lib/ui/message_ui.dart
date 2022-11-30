import 'package:example/widgets/profile_icon.dart';
import 'package:flutter/material.dart';

class MessageUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
        centerTitle: true,
        leading: ProfileIcon.small(imagePath: 'https://xsgames.co/randomusers/assets/avatars/female/40.jpg',),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Icon(Icons.settings),
          )
        ],
        bottom: PreferredSize(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8, left: 16, right: 16),
            child: Container(
              padding: EdgeInsets.only(left: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.search),
                  SizedBox(width: 10,),
                  Text('Search for people and groups', overflow: TextOverflow.visible, style: TextStyle(fontSize: 14,),),
                  Expanded(child: SizedBox(width: 10,)),
                ],
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.all(
                  Radius.circular(24),
                ),
              ),
            ),
          ),
          preferredSize: Size.fromHeight(50),
        ),
      ),
      body: _MessageList(),
    );
  }

}

class _MessageList  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return _MessageTile(index: index,);
    },
      itemCount: 20,
    );
  }
}

class _MessageTile extends StatelessWidget {
  final int index;

  const _MessageTile({required this.index});
  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: _screenHeight/10,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      child: ListTile(
        onTap: (){},
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Martha Craig'),
                SizedBox(width: 5,),
                Text('@craig'),
                Expanded(child: SizedBox(width: 40,)),
                Text('12/2/2022'),
              ],
            ),
            Text('You accepted the request'),
          ],
        ),
        leading: ProfileIcon.large(imagePath: index.isEven? 'https://xsgames.co/randomusers/assets/avatars/female/$index.jpg' : 'https://xsgames.co/randomusers/assets/avatars/male/$index.jpg',),
      ),
    );
  }
}