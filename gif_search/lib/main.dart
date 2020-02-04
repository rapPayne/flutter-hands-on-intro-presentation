import 'package:flutter/material.dart';
import 'package:gif_search/LotsOfGifs.dart';
import 'LotsOfGifs.dart';
import 'RandomGif.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gif Search',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routes: {
        "/lotsofgifs": (ctx) => LotsOfGifs(),
        "/": (ctx) => RandomGif(),
      },
    );
  }
}
