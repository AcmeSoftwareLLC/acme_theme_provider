import 'package:example/widgets/app_buttons.dart';
import 'package:example/widgets/profile_icon.dart';
import 'package:flutter/material.dart';

class SearchUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: ProfileIcon(),
        title: _SearchBar(),
        actions: [Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.settings),
        )],
      ),
      body: _TrendsWidget(),
    );
  }
}

class _SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.all(
          Radius.circular(24),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search),
          SizedBox(width: 10,),
          Text('Search Twitter'),
        ],
      ),
    );
  }
}

class _TrendsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: _screenWidth,
          padding: EdgeInsets.all(8),
          child: Text('Trends for you'),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24),
          child: Container(
            child: Column(
              children: [
                Text('No new trends for you'),
                SizedBox(height: 20),
                Text(
                    'It seems like there\'s not a lot to show you right\n now, but you can see trends for other areas'),
                SizedBox(height: 20),
                AppElevatedButton(title: 'Change location')
              ],
            ),
          ),
        )
      ],
    );
  }
}
