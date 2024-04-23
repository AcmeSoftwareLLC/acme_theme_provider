import 'package:acme_theme/acme_theme.dart';
import 'package:flutter/material.dart';

class EarthColors extends CustomColors<EarthColors> {
  EarthColors({
    required this.apple,
    required this.grape,
    required this.mango,
  }) : super(
          colors: {
            'Apple': apple,
            'Grape': grape,
            'Mango': mango,
          },
          converter: EarthColorsConverter.new,
        );

  final CustomColor apple;
  final CustomColor grape;
  final CustomColor mango;

  static EarthColors of(BuildContext context) {
    return CustomColors.of<EarthColors>(context);
  }
}

class EarthColorsConverter extends CustomColorsConverter<EarthColors> {
  const EarthColorsConverter(super.colors);

  @override
  EarthColors convert() {
    return EarthColors(
      apple: this('Apple'),
      grape: this('Grape'),
      mango: this('Mango'),
    );
  }
}
