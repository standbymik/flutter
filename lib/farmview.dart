import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;

Future<List<Farms>> fetchFarms(http.Client client) async {
  final response =
      await client.get('https://www.friendflock.com/Farmstay/test.php?action=farms');

  // Use the compute function to run parsePhotos in a separate isolate
  return compute(parsePhotos, response.body);
}

// A function that will convert a response body into a List<Photo>
List<Farms> parsePhotos(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Farms>((json) => Farms.fromJson(json)).toList();
}

class Farms {
  final String image;
  final String title;

  Farms({ this.image, this.title});

  factory Farms.fromJson(Map<String, dynamic> json) {
    return Farms(
      image: json['image'] as String,
      title: json['name'] as String,
    );
  }
}
