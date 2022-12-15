import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'scopes/scopes.dart';
import 'typedefs.dart';

class AcmeThemeSync extends StatefulWidget {
  const AcmeThemeSync({
    super.key,
    required this.builder,
    required this.scopeBuilder,
  });

  final ThemedWidgetBuilder builder;
  final Widget Function(BuildContext, ThemedWidgetBuilder) scopeBuilder;

  @override
  State<AcmeThemeSync> createState() => _AcmeThemeSyncState();
}

class _AcmeThemeSyncState extends State<AcmeThemeSync> {
  late final WebSocketChannel _channel;

  @override
  void initState() {
    super.initState();

    _channel = WebSocketChannel.connect(Uri.parse('ws://localhost:23456'));
    _channel.sink.add('connect');
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _channel.stream,
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
}
