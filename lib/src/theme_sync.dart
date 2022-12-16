import 'package:flutter/material.dart';
import 'package:multicast_dns/multicast_dns.dart';
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
    _lookupAcmeThemeBuilderObservatory();
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

  Future<void> _lookupAcmeThemeBuilderObservatory() async {
    const String name = 'acme.theme.builder';
    final MDnsClient client = MDnsClient();
    await client.start();

    final ptrRecords = client.lookup<PtrResourceRecord>(
      ResourceRecordQuery.serverPointer(name),
    );

    await for (final ptr in ptrRecords) {
      final srvRecords = client.lookup<SrvResourceRecord>(
        ResourceRecordQuery.service(ptr.domainName),
      );

      await for (final srv in srvRecords) {
        print(
          'Acme Theme Builder observatory instance found at '
          '${srv.target}:${srv.port}.',
        );
      }
    }
    client.stop();

    print('Done.');
  }
}
