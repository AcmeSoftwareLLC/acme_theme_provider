import 'package:acme_theme_provider/acme_theme_provider.dart';
import 'package:flutter/material.dart';

class FirstCard extends StatelessWidget {
  const FirstCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CoreCard(
      parent: this,
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text('First Card'),
      ),
    );
  }
}

class SecondCard extends StatelessWidget {
  const SecondCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CoreCard(
      parent: this,
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text('Second Card'),
      ),
    );
  }
}
