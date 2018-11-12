import 'dart:async';
import 'dart:convert';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'farmview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Farmstay.asia';

    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder<List<Farms>>(
        future: fetchFarms(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          if (snapshot.hasData) {
            return FarmList(farms: snapshot.data);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class FarmList extends StatelessWidget {
  final List<Farms> farms;

  FarmList({Key key, this.farms}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(farms.length);
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: farms.length,
      itemBuilder: (BuildContext context,int index) {
        return Column(
          children: <Widget>[
            Text(farms[index].title),
            Image.network(farms[index].image),
          ],
        );
      },
      staggeredTileBuilder: (int index) =>
          StaggeredTile.count(2, index.isEven ? 2 : 1),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}
