import 'package:flutter/material.dart';

class ProfileIcon extends StatelessWidget {
  const ProfileIcon._({required this.imagePath});

  final String imagePath;

  factory ProfileIcon.small({required String imagePath}) = ProfileIconSmall._;

  factory ProfileIcon.medium({required String imagePath}) = ProfileIconMedium._;

  factory ProfileIcon.large({required String imagePath}) = ProfileIconLarge._;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      child: Image.network(
        imagePath,
        fit: BoxFit.cover,
      ),
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary, shape: BoxShape.circle),
    );
  }
}

class ProfileIconSmall extends ProfileIcon {
  ProfileIconSmall._({required super.imagePath}) : super._();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Image.network(
              imagePath,
              fit: BoxFit.contain,
            )),
      ),
    );
  }
}

class ProfileIconMedium extends ProfileIcon {
  ProfileIconMedium._({required super.imagePath}) : super._();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: 50,
        width: 50,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Image.network(
              imagePath,
              fit: BoxFit.contain,
            )),
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary, shape: BoxShape.circle),
      ),
    );
  }
}

class ProfileIconLarge extends ProfileIcon {
  ProfileIconLarge._({required super.imagePath}) : super._();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(60),
        child: Image.network(
          imagePath,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
