import 'dart:io';

import 'package:acme_theme/acme_theme.dart';
import 'package:acme_theme/src/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NetworkThemeProvider<T extends Object> extends AcmeThemeProvider<T> {
  NetworkThemeProvider({
    super.key,
    required String url,
    required super.builder,
    this.fallbackAssetPath,
    this.headers,
    super.overrideFn,
    super.customColorsConverterCreator,
    this.cacheKey = 'theme_cache',
  }) : super(source: url) {
    _uri = Uri.tryParse(url);
    assert(_uri != null, 'Invalid Theme URL: $url');
  }

  /// The fallback asset theme path.
  final String? fallbackAssetPath;

  final Map<String, String>? headers;

  final String cacheKey;

  late final Uri? _uri;

  @override
  Widget build(BuildContext context) {
    final hasFallback =
        fallbackAssetPath != null && fallbackAssetPath!.isNotEmpty;

    return FutureBuilder<String>(
      future: _fetchTheme(),
      builder: (context, snapshot) {
        AcmeTheme theme;
        if (snapshot.hasData) {
          theme = AcmeTheme<T>.fromJson(
            snapshot.data!,
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
        return scopedBuilder(context, theme);
      },
    );
  }

  Future<String> _fetchTheme() async {
    if (!kIsWeb && !await _hasThemeExpired) {
      final file = File(await _themeCachePath);
      if (await file.exists()) return file.readAsString();
    }

    final response = await get(_uri!, headers: headers);
    final cacheControl =
        response.headers['Cache-Control'] ?? response.headers['cache-control'];
    final maxAgeRegex = RegExp(r'max-age=(\d+)');

    if (!kIsWeb && maxAgeRegex.hasMatch(cacheControl ?? '')) {
      final file = File(await _themeCachePath);
      file.writeAsBytes(response.bodyBytes);

      final preferences = await SharedPreferences.getInstance();
      final maxAge = int.parse(
        maxAgeRegex.firstMatch(cacheControl!)?.group(1) ?? '0',
      );

      await preferences.setInt(
        _themeExpiryKey,
        DateTime.now().millisecondsSinceEpoch + maxAge * 1000,
      );
    }

    return response.body;
  }

  Future<String> get _themeCachePath async {
    final tempDirectory = await getTemporaryDirectory();

    return join(tempDirectory.path, '$cacheKey.acme');
  }

  Future<bool> get _hasThemeExpired async {
    final preferences = await SharedPreferences.getInstance();
    final expiresAt = preferences.getInt(_themeExpiryKey) ?? 0;

    return DateTime.now().millisecondsSinceEpoch > expiresAt;
  }
}

const String _themeExpiryKey = 'THEME_EXPIRES_AT';
