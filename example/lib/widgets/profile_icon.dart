import 'package:flutter/material.dart';

class ProfileIcon extends StatelessWidget {
  const ProfileIcon._({required this.imagePath});

  final String imagePath;

  const factory ProfileIcon.small({required String imagePath}) =
      ProfileIconSmall._;

  const factory ProfileIcon.medium({required String imagePath}) =
      ProfileIconMedium._;

  const factory ProfileIcon.large({required String imagePath}) =
      ProfileIconLarge._;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary, shape: BoxShape.circle),
      child: Image.network(
        imagePath,
        fit: BoxFit.cover,
      ),
    );
  }
}

class ProfileIconSmall extends ProfileIcon {
  const ProfileIconSmall._({required super.imagePath}) : super._();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: Image.network(
            imagePath,
            fit: BoxFit.contain,
          )),
    );
  }
}

class ProfileIconMedium extends ProfileIcon {
  const ProfileIconMedium._({required super.imagePath}) : super._();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            shape: BoxShape.circle),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: Image.network(
            imagePath,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

class ProfileIconLarge extends ProfileIcon {
  const ProfileIconLarge._({required super.imagePath}) : super._();

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
