import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:nsd/nsd.dart' as nsd;
import 'package:web_socket_channel/web_socket_channel.dart';

import 'scopes/scopes.dart';
import 'typedefs.dart';

class AcmeThemeSync extends StatefulWidget {
  const AcmeThemeSync({
    super.key,
    required this.builder,
    required this.scopeBuilder,
    this.onObservatoryConnected,
  });

  final ThemedWidgetBuilder builder;
  final Widget Function(BuildContext, ThemedWidgetBuilder) scopeBuilder;
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

class AcmeThemeBuilderObservatoryInfo {
  const AcmeThemeBuilderObservatoryInfo({
    required this.host,
    required this.port,
  });

  final String? host;
  final int? port;
}
