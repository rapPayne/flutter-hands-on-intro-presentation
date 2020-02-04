import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'apiKeys.dart';

class RandomGif extends StatefulWidget {
  @override
  _RandomGifState createState() => _RandomGifState();
}

class _RandomGifState extends State<RandomGif> {
  String _gifUrl = "";
  String _searchString = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Random Image"),
      ),
      body: Column(
        children: <Widget>[
          FlatButton(
            child: Icon(Icons.layers),
            onPressed: () { 
              Navigator.of(context).pushNamed("/lotsofgifs");
              },
          ),
          TextFormField(
            onChanged: (val) => _searchString = val,
            decoration: InputDecoration(
              labelText: 'What would you like to see?',
              hintText: "eg. 'Simpsons', 'LOLcats', 'Post Malone', etc.",
            ),
          ),
          (_gifUrl.length > 0) ? Image.network(_gifUrl) : Spacer(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: () async {
          print('I got pressed $giphyApiKey');
          String url =
              'https://api.giphy.com/v1/gifs/random?api_key=$giphyApiKey&tag=$_searchString&rating=g';
          Response res = await get(url);
          Map<String, dynamic> body = json.decode(res.body);
          String imageUrl = body['data']['image_url'];
          setState(() {
            _gifUrl = imageUrl;
          });
          print('imageUrl is $imageUrl');
        },
      ),
    );
  }
}
