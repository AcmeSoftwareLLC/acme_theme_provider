import 'package:acme_theme_provider/acme_theme_provider.dart';
import 'package:acme_theme_provider/src/theme.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class NetworkThemeProvider<T extends Object> extends AcmeThemeProvider<T> {
  NetworkThemeProvider({
    super.key,
    required String url,
    required super.builder,
    this.fallbackAssetPath,
    this.headers,
    super.overrideFn,
    super.customColorsConverterCreator,
  }) : super(source: url) {
    _uri = Uri.tryParse(url);
    assert(_uri != null, 'Invalid Theme URL: $url');
  }

  /// The fallback asset theme path.
  final String? fallbackAssetPath;

  final Map<String, String>? headers;

  late final Uri? _uri;

  @override
  Widget build(BuildContext context) {
    final hasFallback =
        fallbackAssetPath != null && fallbackAssetPath!.isNotEmpty;

    return FutureBuilder<Response>(
      future: get(_uri!, headers: headers),
      builder: (context, snapshot) {
        AcmeTheme theme;
        if (snapshot.hasData) {
          theme = AcmeTheme<T>.fromJson(
            snapshot.data!.body,
            customColorsConverterCreator: customColorsConverterCreator,
          );
        } else if (hasFallback) {
          return AcmeThemeProvider.asset(
            path: fallbackAssetPath!,
            builder: builder,
            overrideFn: overrideFn,
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
