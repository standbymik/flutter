import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
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
