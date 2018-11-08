import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'farmview.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final Future<Farmview> farms;
  MyApp({Key key, this.farms}) : super(key: key);

  Future<Farmview> fetchPost() async {
    final response =
        await http.get('https://www.friendflock.com/Farmstay/test.php?action=farms');
    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON
      return Farmview.fromJson(json.decode(response.body));
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(title: Text('FarmStay.asia')), body: MyHomePage()),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 1.0,
          padding: const EdgeInsets.all(4.0),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          children: <String>[
            'https:\/\/www.friendflock.com\/Farmstay\/farmImages\/farms\/20180906102656.jpg',
            'https:\/\/www.friendflock.com\/Farmstay\/farmImages\/farms\/20180906102656.jpg',
            'https:\/\/www.friendflock.com\/Farmstay\/farmImages\/farms\/20180906102656.jpg',
            'https:\/\/www.friendflock.com\/Farmstay\/farmImages\/farms\/20180906102656.jpg',
            'https:\/\/www.friendflock.com\/Farmstay\/farmImages\/farms\/20180906102656.jpg',
            'https:\/\/www.friendflock.com\/Farmstay\/farmImages\/farms\/20180906102656.jpg',
            'https:\/\/www.friendflock.com\/Farmstay\/farmImages\/farms\/20180906102656.jpg',
          ].map((String url) {
            return new GridTile(
                child: new Image.network(url, fit: BoxFit.cover));
          }).toList()),
    );
  }
}
