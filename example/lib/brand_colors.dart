import 'package:acme_theme/acme_theme.dart';
import 'package:flutter/material.dart';

class BrandColors extends CustomColors<BrandColors> {
  BrandColors({
    required this.live,
    required this.dead,
  }) : super(
          colors: {
            'live': live,
            'dead': dead,
          },
          converter: BrandColorsConverter.new,
        );

  final CustomColor live;
  final CustomColor dead;

  static BrandColors of(BuildContext context) {
    return CustomColors.of<BrandColors>(context);
  }
}

class BrandColorsConverter extends CustomColorsConverter<BrandColors> {
  const BrandColorsConverter(super.colors);

  @override
  BrandColors convert() {
    return BrandColors(live: this('live'), dead: this('dead'));
  }
}
