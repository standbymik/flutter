import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  List list = List();

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


