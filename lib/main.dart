import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'farmview.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

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
final Future<Farmview> farms;
  MyHomePage({Key key, this.farms}) : super(key: key);

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
    return Container(
      child: FutureBuilder<Farmview>(
            future: farms,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.image);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner
              return CircularProgressIndicator();
            },
          ),
    );
  }
}


class Farmview {
  final String image;
  final String farm;
  final String body;

  Farmview({this.image,this.farm, this.body});

  factory Farmview.fromJson(Map<String, dynamic> json) {
    return Farmview(
      image:json['image'],
      farm:json['name'],
      body: json['body'],
    );
  }
}
