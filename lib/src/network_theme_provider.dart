import 'package:acme_theme_provider/acme_theme_provider.dart';
import 'package:acme_theme_provider/src/theme.dart';
import 'package:acme_theme_provider/src/typedefs.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class NetworkThemeProvider extends AcmeThemeProvider {
  final String url;
  final ThemedWidgetBuilder builder;
  final ThemeOverride? overrideFn;
  final Map<String, String>? headers;

  late final Uri? _uri;

  NetworkThemeProvider({
    Key? key,
    required this.url,
    required this.builder,
    this.headers,
    this.overrideFn,
  }) : super(
          key: key,
          source: url,
          builder: builder,
          overrideFn: overrideFn,
        ) {
    _uri = Uri.tryParse(url);
    assert(_uri != null, 'Invalid Theme URL: $url');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Response>(
      future: get(_uri!, headers: headers),
      builder: (context, snapshot) {
        AcmeTheme theme;
        if (snapshot.hasData) {
          theme = AcmeTheme.fromJson(snapshot.data!.body);
        } else {
          theme = AcmeTheme.fallback();
        }

        theme = overrideFn?.call(theme) ?? theme;
        return builder(context, theme);
      },
    );
  }
}
