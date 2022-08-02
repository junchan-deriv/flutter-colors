import 'package:flutter/material.dart';
import 'package:navigation_tests/list_item.dart';
import 'package:navigation_tests/pick_color.dart';
import 'package:navigation_tests/shades_page.dart';

class MyHomePage extends StatefulWidget {
  static const String route = "/";
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void navigateToShadePageStatic(
      BuildContext context, MaterialAccentColor color) {
    Navigator.of(context).pushNamed("/shades", arguments: color);
  }

  void navigateToShadePage(BuildContext context, MaterialAccentColor color) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return ShadesPage(color: color);
      },
    ));
  }

  ///
  /// show the selected color to use
  ///
  void showSelectedColorDialog(BuildContext context, Color selectedColor) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Result"),
          content: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("You have selected "),
              Container(
                  decoration: ShapeDecoration(
                    color: selectedColor,
                    shape: const CircleBorder(),
                  ),
                  width: 20,
                  height: 20)
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Colors'), centerTitle: true),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          var color = Colors.accents.elementAt(index);
          return GestureDetector(
            onTap: () {
              navigateToShadePageStatic(context, color);
            },
            child: ListItem(
              key: UniqueKey(),
              color: color,
            ),
          );
        },
        itemCount: Colors.accents.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //this will open the new page
          var result = Navigator.of(context).pushNamed(PickColorPage.route);
          //the result will resolves to the parameter provided into pop() when returning
          result.then((result) {
            if (result is Color) {
              //it contain the color returned from the pick color page
              showSelectedColorDialog(context, result);
            }
          });
        },
        child: const Icon(Icons.create),
      ),
    );
  }
}
