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
        body: Column(
          children: <Widget>[
            Text('Farms'),
            _listFarms(),
          ],
        ));
  }

  _listFarms() {
    return FutureBuilder<List<Farms>>(
      future: fetchFarms(http.Client()),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);

        if (snapshot.hasData) {
          return FarmList(farms: snapshot.data);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class FarmList extends StatelessWidget {
  final List<Farms> farms;

  FarmList({Key key, this.farms}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      shrinkWrap: true,
      crossAxisCount: 4,
      itemCount: farms.length,
      padding: const EdgeInsets.all(4.0),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.all(5.0),
          child: Card(
            child: Column(
              children: <Widget>[
                Text(farms[index].title),
                Container(
                  height:200.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(farms[index].image),
                          fit: BoxFit.cover)),
                ),
              ],
            ),
          ),
        );
      },
      staggeredTileBuilder: (int index) =>
          StaggeredTile.count(2, index.isEven ? 2 : 2),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}
