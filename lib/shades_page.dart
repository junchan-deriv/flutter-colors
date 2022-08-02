import 'package:flutter/material.dart';
import 'package:navigation_tests/list_item.dart';

class ShadesPage extends StatelessWidget {
  final MaterialAccentColor color;
  static const String route = "/shades";
  const ShadesPage({Key? key, required this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final List<Color> accentShades = <Color>[
      color.shade100,
      color.shade200,
      color.shade400,
      color.shade700
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: const Text('Shades'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: accentShades.length,
        itemBuilder: (context, index) => ListItem(
          color: accentShades[index],
        ),
      ),
    );
  }
}
