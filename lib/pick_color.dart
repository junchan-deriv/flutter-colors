import 'package:flutter/material.dart';
import 'package:navigation_tests/int_slider.dart';
import 'package:scribble/scribble.dart';

class PickColorPage extends StatefulWidget {
  static const String route = "/pick_color";
  const PickColorPage({Key? key}) : super(key: key);

  @override
  State<PickColorPage> createState() => _PickColorPageState();
}

class _PickColorPageState extends State<PickColorPage> {
  Color selectedColor = const Color.fromARGB(255, 0, 0, 0);

  ///Color masks
  List<int> masks = [0xFF00FFFF, 0xFFFF00FF, 0xFFFFFF00];
  List<int> shifts = [16, 8, 0];
  List<String> colors = ["Red", "Green", "Blue"];
  List<MaterialAccentColor> accent = [
    Colors.redAccent,
    Colors.greenAccent,
    Colors.blueAccent
  ];
  ScribbleNotifier notifier = ScribbleNotifier();
  @override
  void dispose() {
    notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    notifier.setColor(selectedColor);
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
                SizedBox(
                    height: 200,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Wrap(children: [
                          Text("${colors[index]}:"),
                          IntSlider(
                            value: (selectedColor.value & ~masks[index]) >>
                                shifts[index],
                            max: 255,
                            divisions: 256,
                            onChanged: (v) {
                              setState(() {
                                selectedColor = Color(
                                    selectedColor.value & (masks[index]) |
                                        (v << shifts[index]));
                              });
                            },
                            colorScheme: accent[index],
                          ),
                        ]);
                      },
                    )),
                const Text("Selected color:"),
                Container(
                    margin: const EdgeInsets.all(10),
                    decoration: ShapeDecoration(
                      color: selectedColor,
                      shape: const CircleBorder(),
                    ),
                    width: 100,
                    height: 100),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(selectedColor);
                  },
                  child: const Text("Select this color"),
                ),
                Expanded(
                  child: ClipRect(
                    clipBehavior: Clip.hardEdge,
                    child: Scribble(notifier: notifier),
                  ),
                ),
              ],
            )));
  }
}
