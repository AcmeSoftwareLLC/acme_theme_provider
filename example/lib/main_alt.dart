import 'package:acme_theme/acme_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EarthApp());
}

class EarthApp extends StatelessWidget {
  const EarthApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AcmeThemeScope.asset(
      path: 'assets/themes/earth.acme',
      customColorsConverterCreator: EarthColorsConverter.new,
      builder: (context, theme) {
        return MaterialApp(
          theme: theme.lightTheme,
          darkTheme: theme.darkTheme,
          themeMode: theme.themeMode,
          home: const HomePage(),
        );
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Colors'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const SizedBox(height: 16),
          for (final color in EarthColors.of(context).colors.values)
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: ColorRow(color: color),
            ),
        ],
      ),
    );
  }
}

class ColorRow extends StatelessWidget {
  const ColorRow({super.key, required this.color});

  final CustomColor color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ColorBlock(
              name: color.name,
              color: color.color,
              foregroundColor: color.onColor,
            ),
          ),
          Expanded(
            child: ColorBlock(
              name: 'On Color',
              color: color.onColor,
              foregroundColor: color.color,
            ),
          ),
          Expanded(
            child: ColorBlock(
              name: 'Container',
              color: color.colorContainer,
              foregroundColor: color.onColorContainer,
            ),
          ),
          Expanded(
            child: ColorBlock(
              name: 'On Color Container',
              color: color.onColorContainer,
              foregroundColor: color.colorContainer,
            ),
          ),
        ],
      ),
    );
  }
}

class ColorBlock extends StatelessWidget {
  const ColorBlock({
    super.key,
    required this.name,
    required this.color,
    required this.foregroundColor,
  });

  final String name;
  final Color color;
  final Color foregroundColor;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: color),
      child: Center(
        child: Text(name, style: TextStyle(color: foregroundColor)),
      ),
    );
  }
}

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
