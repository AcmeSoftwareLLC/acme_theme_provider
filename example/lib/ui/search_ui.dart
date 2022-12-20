import 'package:clean_framework_router/clean_framework_router.dart';
import 'package:example/routes.dart';
import 'package:example/widgets/app_buttons.dart';
import 'package:example/widgets/app_icons.dart';
import 'package:example/widgets/profile_icon.dart';
import 'package:flutter/material.dart';

class SearchUI extends StatelessWidget {
  const SearchUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        leading: const ProfileIcon.small(
          imagePath:
              'https://xsgames.co/randomusers/assets/avatars/female/40.jpg',
        ),
        title: _SearchBar(),
        centerTitle: true,
      ),
      body: Container(
        color: Theme.of(context).colorScheme.surfaceVariant,
        child: Column(
          children: [
            _TrendsWidget(),
          ],
        ),
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SizedBox(
        height: 32,
        child: TextField(
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).colorScheme.surfaceVariant,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            contentPadding: const EdgeInsets.symmetric(horizontal: 40),
            prefixIcon: AppIcons(
              iconPath: 'assets/icons/search_stroke_icon.png',
              color: Theme.of(context).colorScheme.outline,
            ),
            labelText: 'Search Twitter',
            labelStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.outline,
                ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
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
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: screenWidth,
          color: Theme.of(context).colorScheme.surface,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 48,
                width: screenWidth,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.surfaceVariant,
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  child: Text('Trends for you',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.w800,
                          )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 36, left: 80, right: 80),
                child: Text(
                  'No new trends for you',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.w800),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'It seems like there\'s not a lot to show you right\n now, but you can see trends for other areas',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant),
              ),
              const SizedBox(height: 20),
              AppElevatedButton(
                title: 'Change location',
                onPressed: () {},
              ),
              const SizedBox(height: 40),
            ],
          ),
        )
      ],
    );
  }
}
