import 'package:example/widgets/app_buttons.dart';
import 'package:example/widgets/profile_icon.dart';
import 'package:flutter/material.dart';

class SearchUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: ProfileIcon.small(imagePath: 'https://xsgames.co/randomusers/assets/avatars/female/40.jpg',),
        title: _SearchBar(),
        actions: [Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.settings_outlined, color: Theme.of(context).colorScheme.primary,),
        )],
      ),
      body: Container(child: Column(
        children: [
          _TrendsWidget(),
        ],
      ),
        color: Theme.of(context).colorScheme.surfaceVariant,
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
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
          Text('Search Twitter', style: TextStyle(fontSize: 16),),
        ],
      ),
    );
  }
}

class _TrendsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    final _screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Container(
          width: _screenWidth,
          color: Theme.of(context).colorScheme.surface,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: _screenWidth,
                padding: EdgeInsets.all(8),
                child: Text('Trends for you', style: Theme.of(context).textTheme.titleMedium),
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).colorScheme.surfaceVariant,),
                ),
              ),
              SizedBox(height: _screenHeight/10,),
              Text('No new trends for you', style: Theme.of(context).textTheme.titleLarge,),
              SizedBox(height: 20),
              Text(
                  'It seems like there\'s not a lot to show you right\n now, but you can see trends for other areas'),
              SizedBox(height: 20),
              AppElevatedButton(title: 'Change location'),
              SizedBox(height: 40),
            ],
          ),
        )
      ],
    );
  }
}
