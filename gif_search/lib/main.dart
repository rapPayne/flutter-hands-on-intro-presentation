import 'package:flutter/material.dart';
import 'RandomGif.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gif Search',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: RandomGif(),
    );
  }
}