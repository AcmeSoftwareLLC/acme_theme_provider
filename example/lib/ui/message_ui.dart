import 'package:clean_framework_router/clean_framework_router.dart';
import 'package:example/routes.dart';
import 'package:example/widgets/profile_icon.dart';
import 'package:flutter/material.dart';

class MessageUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages', style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500, color: Theme.of(context).colorScheme.onBackground,)),
        centerTitle: true,
        leading: ProfileIcon.small(imagePath: 'https://xsgames.co/randomusers/assets/avatars/female/40.jpg',),
        actions: [
          GestureDetector(
            onTap: () => context.router.push(Routes.settings,),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ImageIcon(AssetImage('assets/icons/settings_stroke_icon.png'), color: Theme.of(context).colorScheme.primary),
            ),
          )
        ],
        bottom: PreferredSize(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Container(
              height: 32,
              child: TextField(
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor:  Theme.of(context).colorScheme.surfaceVariant,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  contentPadding: EdgeInsets.symmetric(horizontal: 40),
                  prefixIcon: ImageIcon(AssetImage('assets/icons/search_stroke_icon.png'), color: Theme.of(context).colorScheme.onSurfaceVariant,),
                  labelText: 'Search for people and groups',
                  labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant, fontWeight: FontWeight.w400,),
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
          ),
          preferredSize: Size.fromHeight(64),
        ),
        shape: Border(
            bottom: BorderSide(
                color: Theme.of(context).colorScheme.surfaceVariant,
                width: 0.5,
            )
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
    return Container(
      height: 80,
      decoration: BoxDecoration(
        border: Border.all(width: 0.5, color: Theme.of(context).colorScheme.surfaceVariant),
      ),
      padding: EdgeInsets.all(8),
      child: ListTile(
        onTap: (){},
        focusColor: Theme.of(context).colorScheme.primaryContainer,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Martha Craig', style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500,),),
                SizedBox(width: 5,),
                Text('@craig', style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant, fontWeight: FontWeight.w400),),
                Expanded(child: SizedBox(width: 40,)),
                Text('12/2/2022',  style: Theme.of(context).textTheme.labelLarge!.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant, fontWeight: FontWeight.w500,),),
              ],
            ),
            Text('You: You\'re very welcome, Aubrey', style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant, fontWeight: FontWeight.w400),),
          ],
        ),
        leading: ProfileIcon.large(imagePath: index.isEven? 'https://xsgames.co/randomusers/assets/avatars/female/$index.jpg' : 'https://xsgames.co/randomusers/assets/avatars/male/$index.jpg',),
      ),
    );
  }
}