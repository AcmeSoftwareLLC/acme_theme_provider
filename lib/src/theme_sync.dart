import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:nsd/nsd.dart' as nsd;
import 'package:web_socket_channel/web_socket_channel.dart';

import 'scopes/scopes.dart';
import 'typedefs.dart';

/// A [Widget] that connects with the available Acme Theme Builder Observatory,
/// and provides the [AcmeThemeData] resolved from the observatory to its descendants.
///
/// If no observatory is available, the [scopeBuilder] will be used.
///
/// This widget is useful for testing and development purposes.
class AcmeThemeSync extends StatefulWidget {
  /// Creates an instance of [AcmeThemeSync].
  const AcmeThemeSync({
    super.key,
    required this.builder,
    required this.scopeBuilder,
    this.onObservatoryConnected,
  });

  /// The builder function that will be used to build the widget tree.
  final ThemedWidgetBuilder builder;

  /// The builder function that will be used to build the widget tree when no observatory is available.
  final Widget Function(BuildContext, ThemedWidgetBuilder) scopeBuilder;

  /// The callback that will be called when an observatory is connected.
  final ValueChanged<AcmeThemeBuilderObservatoryInfo>? onObservatoryConnected;

  @override
  State<AcmeThemeSync> createState() => _AcmeThemeSyncState();
}

class _AcmeThemeSyncState extends State<AcmeThemeSync> {
  WebSocketChannel? _channel;

  @override
  void initState() {
    super.initState();
    _connectWithAcmeThemeBuilderObservatory();
  }

  @override
  Widget build(BuildContext context) {
    if (_channel == null) return widget.scopeBuilder(context, widget.builder);

    return StreamBuilder(
      stream: _channel!.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return AcmeThemeScope(
            source: snapshot.data as String,
            builder: widget.builder,
          );
        }

        return widget.scopeBuilder(context, widget.builder);
      },
    );
  }

  Future<void> _connectWithAcmeThemeBuilderObservatory() async {
    final discovery = await nsd.startDiscovery('_http._tcp', autoResolve: true);

    discovery.addListener(
      () {
        for (final service in discovery.services) {
          final address = '${service.host}:${service.port}';

          if (service.name == 'acme_theme_builder') {
            log('Found Acme Theme Builder Observatory at: $address');
            nsd.stopDiscovery(discovery);

            _channel = WebSocketChannel.connect(Uri.parse('ws://$address'));
            print(_channel);
            widget.onObservatoryConnected?.call(
              AcmeThemeBuilderObservatoryInfo(
                host: service.host,
                port: service.port,
              ),
            );

            return _channel!.sink.add('connect');
          }
        }
      },
    );
  }
}

/// The information about the Acme Theme Builder Observatory.
class AcmeThemeBuilderObservatoryInfo {
  /// Creates an instance of [AcmeThemeBuilderObservatoryInfo].
  const AcmeThemeBuilderObservatoryInfo({
    required this.host,
    required this.port,
  });

  /// The host of the Acme Theme Builder Observatory.
  final String? host;

  /// The port of the Acme Theme Builder Observatory.
  final int? port;
}
