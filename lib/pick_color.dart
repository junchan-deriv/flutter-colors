import 'package:flutter/material.dart';
import 'package:navigation_tests/int_slider.dart';

class PickColorPage extends StatefulWidget {
  static const String route = "/pick_color";
  const PickColorPage({Key? key}) : super(key: key);

  @override
  State<PickColorPage> createState() => _PickColorPageState();
}

class _PickColorPageState extends State<PickColorPage> {
  int _r = 0, _g = 0, _b = 0;

  @override
  Widget build(BuildContext context) {
    //construct the color from the rgb
    final Color selected = Color.fromARGB(255, _r, _g, _b);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Pick your color'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Red:"),
                IntSlider(
                  value: _r,
                  max: 255,
                  divisions: 256,
                  onChanged: (v) {
                    setState(() {
                      _r = v;
                    });
                  },
                  colorScheme: Colors.redAccent,
                ),
                const Text("Green:"),
                IntSlider(
                  value: _g,
                  max: 255,
                  divisions: 256,
                  onChanged: (v) {
                    setState(() {
                      _g = v;
                    });
                  },
                  colorScheme: Colors.greenAccent,
                ),
                const Text("Blue:"),
                IntSlider(
                  value: _b,
                  max: 255,
                  divisions: 256,
                  onChanged: (v) {
                    setState(() {
                      _b = v;
                    });
                  },
                  colorScheme: Colors.blueAccent,
                ),
                const Text("Selected color:"),
                Container(
                  margin: const EdgeInsets.all(10),
                    decoration: ShapeDecoration(
                      color: selected,
                      shape: const CircleBorder(),
                    ),
                    width: 100,
                    height: 100),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(selected);
                  },
                  child: const Text("Select this color"),
                ),
              ],
            )));
  }
}
