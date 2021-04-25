import 'package:acme_theme_provider/acme_theme_provider.dart';
import 'package:acme_theme_provider/src/theme.dart';
import 'package:acme_theme_provider/src/typedefs.dart';
import 'package:flutter/material.dart';

class AssetThemeProvider extends AcmeThemeProvider {
  final String path;
  final ThemedWidgetBuilder builder;
  final ThemeOverride? overrideFn;

  const AssetThemeProvider({
    Key? key,
    required this.path,
    required this.builder,
    this.overrideFn,
  }) : super(
          key: key,
          source: path,
          builder: builder,
          overrideFn: overrideFn,
        );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: DefaultAssetBundle.of(context).loadString(source),
      builder: (context, snapshot) {
        AcmeTheme theme;
        if (snapshot.hasData) {
          theme = AcmeTheme.fromJson(snapshot.data!);
        } else {
          theme = AcmeTheme.fallback();
        }

        theme = overrideFn?.call(theme) ?? theme;
        return builder(context, theme);
      },
    );
  }
}
