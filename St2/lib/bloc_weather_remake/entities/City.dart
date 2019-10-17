import 'dart:convert';

import 'package:equatable/equatable.dart';

class City extends Equatable {
  final String title;
  final String locationType;
  final int id;
  final String latLon;

  City({this.title, this.locationType, this.id, this.latLon});

  int getId() => id;

  static City fromJson(String body) {
    final locationJson = jsonDecode(body) as List;

    if (locationJson.isEmpty) {
      return null;
    } else {
      return City(
        title: (locationJson.first)["title"],
        locationType: (locationJson.first)["location_type"],
        id: (locationJson.first)["woeid"],
        latLon: (locationJson.first)["latt_long"],
      );
    }
  }

  @override
  String toString() {
    return 'City{title: $title, locationType: $locationType, id: $id, latLon: $latLon}';
  }
}