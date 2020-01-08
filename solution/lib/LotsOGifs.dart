import 'package:flutter/material.dart';
import 'apiKeys.dart';
import 'dart:convert';
import 'package:http/http.dart';

class LotsOGifs extends StatefulWidget {
  @override
  _LotsOGifsState createState() => _LotsOGifsState();
}

class _LotsOGifsState extends State<LotsOGifs> {
  String _searchString = '';
  List<String> _gifs = List<String>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search GIFs'),
      ),
      body: Container(
          child: Column(
        children: <Widget>[
          TextField(
            onChanged: (val) => _searchString = val,
            decoration: InputDecoration(
              hintText: '"simpsons", "hot dog", "cars", etc.',
              labelText: "Search",
              icon: Icon(Icons.search),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Image.network(_gifs[index]);
              },
              itemCount: _gifs.length,
            ),
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: getImageUrls,
      ),
    );
  }

  void getImageUrls() async {
    String url =
        'https://api.giphy.com/v1/gifs/search?api_key=$giphyApiKey&rating=pg&q=$_searchString';
    try {
      Response response = await get(url);
      if (response.statusCode == 200) {
        Map<String, dynamic> res = json.decode(response.body);
        List<dynamic> allImages = res['data'];
        setState(() {
          List<dynamic> foo =
              allImages.map((image) => image['images']).toList();
          _gifs =
              foo.map((image) => image['original']['url'].toString()).toList();
        });
      } else {
        print('Fail! ${response.statusCode}');
      }
    } catch (e) {
      print("error: $e");
    }
  }
}
