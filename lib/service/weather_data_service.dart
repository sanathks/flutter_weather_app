import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:weapp/model/weather_collection.dart';


class WeatherDataService {
  static Future<WeatherCollection>  fetchAllData() async {
    final response = await http
    .get(Uri.parse('https://api.openweathermap.org/data/2.5/onecall?lat=6.9319&lon=79.8478&appid=1ca1f3bf48bad9672bde716403704826'));

    if (response.statusCode == 200) {
      return WeatherCollection.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
}