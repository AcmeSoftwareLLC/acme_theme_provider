import 'package:acme_theme_provider/acme_theme_provider.dart';
import 'package:acme_theme_provider/src/theme.dart';
import 'package:flutter/material.dart';

class AssetThemeProvider<T extends Object> extends AcmeThemeProvider<T> {
  const AssetThemeProvider({
    super.key,
    required this.path,
    required super.builder,
    super.overrideFn,
    super.customColorsConverterCreator,
  }) : super(source: path);

  final String path;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: DefaultAssetBundle.of(context).loadString(source),
      builder: (context, snapshot) {
        AcmeTheme theme;
        if (snapshot.hasData) {
          theme = AcmeTheme<T>.fromJson(
            snapshot.data!,
            customColorsConverterCreator: customColorsConverterCreator,
          );
        } else {
          theme = AcmeTheme<T>.fallback(
            customColorsConverterCreator: customColorsConverterCreator,
          );
        }

        theme = overrideFn?.call(theme) ?? theme;
        return builder(context, theme);
      },
    );
  }
}
