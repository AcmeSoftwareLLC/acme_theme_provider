// Copyright (c) 2022. Acme Software LLC. All rights reserved.

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../theme.dart';
import 'acme_theme_scope.dart';

/// A [Widget] that provides a [AcmeThemeData] to its descendants
/// based on the provided network url.
class NetworkThemeScope<T extends Object> extends AcmeThemeScope<T> {
  /// Creates a [NetworkThemeScope] that provides a [AcmeThemeData] to its descendants.
  NetworkThemeScope({
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

  /// The network headers to be provided while requesting the theme from network.
  final Map<String, String>? headers;

  /// The cache key to be used for caching the theme.
  final String cacheKey;

  late final Uri? _uri;

  @override
  Widget build(BuildContext context) {
    final hasFallback =
        fallbackAssetPath != null && fallbackAssetPath!.isNotEmpty;

    return FutureBuilder<String>(
      future: _fetchTheme(),
      builder: (context, snapshot) {
        AcmeThemeData theme;
        if (snapshot.hasData) {
          theme = AcmeThemeData<T>.fromJson(
            snapshot.data!,
            customColorsConverterCreator: customColorsConverterCreator,
          );
        } else if (hasFallback) {
          return AcmeThemeScope.asset(
            path: fallbackAssetPath!,
            builder: builder,
            overrideFn: overrideFn,
            customColorsConverterCreator: customColorsConverterCreator,
          );
        } else {
          theme = AcmeThemeData<T>.fallback(
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
