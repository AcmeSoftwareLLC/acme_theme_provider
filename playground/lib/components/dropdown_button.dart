import 'package:acme_theme_provider/acme_theme_provider.dart';

class FirstDropdownButton extends CoreDropdownButton {
  const FirstDropdownButton({
    super.key,
    super.hint,
  });
}

class SecondDropdownButton extends CoreDropdownButton<String> {
  const SecondDropdownButton({
    super.key,
    super.hint,
    super.value,
    super.items,
    super.onChanged,
  });
}
