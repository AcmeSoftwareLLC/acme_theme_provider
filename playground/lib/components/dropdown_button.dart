import 'package:acme_theme_provider/acme_theme_provider.dart';
import 'package:flutter/material.dart';

class FirstDropdownButton extends StatelessWidget {
  const FirstDropdownButton({
    super.key,
    this.hint,
  });
  final Widget? hint;

  @override
  Widget build(BuildContext context) {
    return CoreDropdownButton(
      parent: this,
      hint: hint,
    );
  }
}

class SecondDropdownButton extends StatefulWidget {
  const SecondDropdownButton({
    super.key,
    this.hint,
  });

  final Widget? hint;

  @override
  State<SecondDropdownButton> createState() => _SecondDropdownButtonState();
}

class _SecondDropdownButtonState extends State<SecondDropdownButton> {
  String? value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: CoreDropdownButton(
        parent: widget,
        hint: widget.hint,
        value: value,
        items: ['Test', 'Pass']
            .map(
              (e) => DropdownMenuItem<String>(
                value: e,
                child: Text(e),
              ),
            )
            .toList(),
        onChanged: (value) {
          setState(() {
            this.value = value as String;
          });
        },
      ),
    );
  }
}
