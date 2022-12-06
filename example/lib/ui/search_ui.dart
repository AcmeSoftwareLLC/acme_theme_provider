import 'package:clean_framework_router/clean_framework_router.dart';
import 'package:example/routes.dart';
import 'package:example/widgets/app_buttons.dart';
import 'package:example/widgets/profile_icon.dart';
import 'package:flutter/material.dart';

class SearchUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        leading: ProfileIcon.small(imagePath: 'https://xsgames.co/randomusers/assets/avatars/female/40.jpg',),
        title: _SearchBar(),
        actions: [
          GestureDetector(
            onTap: () => context.router.push(Routes.settings,),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ImageIcon(AssetImage('assets/icons/settings_stroke_icon.png'), color: Theme.of(context).colorScheme.primary),
            ),
          )
        ],
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

    return SizedBox(
      child: Container(
        height: 32,
        child: TextField(
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            filled: true,
            fillColor:  Theme.of(context).colorScheme.surfaceVariant,
            floatingLabelAlignment: FloatingLabelAlignment.center,
            contentPadding: EdgeInsets.symmetric(horizontal: 40),
            prefixIcon: ImageIcon(AssetImage('assets/icons/search_stroke_icon.png'), color: Theme.of(context).colorScheme.outline,),
            labelText: 'Search Twitter',
            labelStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Theme.of(context).colorScheme.outline,),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TrendsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
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
                height: 48,
                width: _screenWidth,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  child: Text('Trends for you', style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w900, )),
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).colorScheme.surfaceVariant,),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 36, left: 80, right: 80),
                child: Text('No new trends for you', style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600),),
              ),
              SizedBox(height: 20),
              Text(
                  'It seems like there\'s not a lot to show you right\n now, but you can see trends for other areas', style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.outline
              ),),
              SizedBox(height: 20),
              AppElevatedButton(title: 'Change location', onPressed: ( ){},),
              SizedBox(height: 40),
            ],
          ),
        )
      ],
    );
  }
}
