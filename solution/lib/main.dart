import 'package:flutter/material.dart';
import 'package:gif_search/LotsOGifs.dart';
import 'RandomGif.dart';
import 'LotsOGifs.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      routes: {
        "/": (_ctx) => RandomGif(),
        "/lotsofgifs": (_ctx) => LotsOGifs(),
      },
    );
  }
}
