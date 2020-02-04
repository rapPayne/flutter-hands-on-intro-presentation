import 'package:flutter/material.dart';
import 'dart:convert';
import 'apiKeys.dart';
import 'package:http/http.dart';

class RandomGif extends StatefulWidget {
  @override
  _RandomGifState createState() => _RandomGifState();
}

class _RandomGifState extends State<RandomGif> {
  String _gifUrl = '';
  String _searchString = 'football';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Giphy Gif'),
      ),
      body: Container(
          child: Column(
        children: <Widget>[
          FlatButton(
            child: Icon(Icons.people),
            onPressed: () => Navigator.pushNamed(context, '/lotsofgifs'),
            ),
          TextField(
            onChanged: (val) {
              _searchString = val;
            },
          ),
          Image.network(_gifUrl, fit: BoxFit.contain)
        ],
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: () => getRandomImage(),
      ),
    );
  }

  void getRandomImage() async {
    String url =
        'https://api.giphy.com/v1/gifs/random?rating=pg&api_key=$giphyApiKey&tag=$_searchString';
    Response res = await get(url);
    Map<String, dynamic> response = json.decode(res.body);
    this.setState(() {
      _gifUrl = response['data']['image_url'];
    });
  }
}
