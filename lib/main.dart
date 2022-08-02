import 'package:flutter/material.dart';
import 'package:navigation_tests/pick_color.dart';
import 'package:navigation_tests/shades_page_with_param.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const MyHomePage(title: 'Colors'),
      routes: {
        '/shades':(context)=>const ShadesPageWithParam(),
        PickColorPage.route:(context)=>const PickColorPage()
      },
    );
  }
}
