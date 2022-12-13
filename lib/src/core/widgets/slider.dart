import 'package:flutter/material.dart';

import '../configs/slider_config.dart';
import '../core_widget.dart';

abstract class CoreSlider extends CoreWidget<SliderConfig> {
  const CoreSlider({
    super.key,
    super.name,
    required this.value,
    required this.onChanged,
    this.focusNode,
    this.label,
    this.max = 1.0,
    this.min = 0.0,
    this.divisions,
    this.onChangeEnd,
    this.onChangeStart,
    this.semanticFormatterCallback,
  });

  final double value;
  final ValueChanged<double> onChanged;
  final FocusNode? focusNode;
  final int? divisions;
  final String? label;
  final double max;
  final double min;
  final ValueChanged<double>? onChangeEnd;
  final ValueChanged<double>? onChangeStart;
  final SemanticFormatterCallback? semanticFormatterCallback;

  @override
  Widget render(BuildContext context, SliderConfig config) {
    return Theme(
      data: Theme.of(context).copyWith(sliderTheme: config.theme),
      child: Slider(
        value: value,
        onChanged: onChanged,
        focusNode: focusNode,
        divisions: divisions,
        label: label,
        max: max,
        min: min,
        onChangeEnd: onChangeEnd,
        onChangeStart: onChangeStart,
        semanticFormatterCallback: semanticFormatterCallback,
        autofocus: config.autofocus,
        activeColor: config.activeColor,
        inactiveColor: config.inactiveColor,
      ),
    );
  }
}
