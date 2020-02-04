import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'apiKeys.dart';

class LotsOfGifs extends StatefulWidget {
  @override
  _LotsOfGifsState createState() => _LotsOfGifsState();
}

class _LotsOfGifsState extends State<LotsOfGifs> {
  List<String> _gifUrls = [""];
  String _searchString = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lots of Random Gifs"),
      ),
      body: Column(
        children: <Widget>[
          TextFormField(
            onChanged: (val) => _searchString = val,
            decoration: InputDecoration(
              labelText: 'What would you like to see?',
              hintText: "eg. 'Simpsons', 'LOLcats', 'Post Malone', etc.",
            ),
          ),
          (_gifUrls[0].length > 0) ? Image.network(_gifUrls[0]) : Spacer(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: fetchGifs,
      ),
    );
  }

  void fetchGifs() async {
    print('I got pressed $giphyApiKey');
    String url =
        'https://api.giphy.com/v1/gifs/search?api_key=$giphyApiKey&q=$_searchString&rating=g';
    try {
      Response res = await get(url);
      Map<String, dynamic> body = json.decode(res.body);
      List<dynamic> images = body['data'];
      List<String> imageUrls = images
          .map<String>((img) => img['images']['original']['url'].toString())
          .toList();
      setState(() {
        _gifUrls = imageUrls;
      });
      print('imageUrl is $imageUrls');
    } catch (ex) {
      print(ex.message);
    }
  }
}
