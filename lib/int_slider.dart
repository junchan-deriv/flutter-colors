import 'package:flutter/material.dart';

class IntSlider extends StatelessWidget {
  final int value, max, divisions;
  final Function(int) onChanged;
  final MaterialAccentColor colorScheme;
  final String? label;
  const IntSlider(
      {Key? key,
      required this.value,
      required this.max,
      required this.divisions,
      required this.onChanged,
      this.colorScheme=Colors.blueAccent,
      this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: value.toDouble(),
      max: max.toDouble(),
      divisions: divisions,
      label:label??value.toString(),
      onChanged: (v) {
        onChanged(v.toInt());
      },
      thumbColor: colorScheme.shade200,
      activeColor: colorScheme.shade400,
      inactiveColor: colorScheme.shade100,
    );
  }
}
