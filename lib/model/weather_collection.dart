import 'dart:developer';
import 'package:intl/intl.dart';
import 'package:weapp/model/weather_detail_model.dart';
import 'package:weapp/model/weather_summary_model.dart';

class WeatherCollection {
  final WeatherDetailModel current;
  final List<WeatherSummaryModel> hourly;
  final List<WeatherSummaryModel> week;

  WeatherCollection(this.current, this.hourly, this.week);

  factory WeatherCollection.fromJson(Map<String, dynamic> json) {

    List<dynamic> hourlyData = json['hourly'];
    List<WeatherSummaryModel> hourly = hourlyData.map((element) {
      var dt = DateFormat.jm().format(DateTime.now());
      var dtLable = "PM";
      var icon = element['weather'][0]['icon'];
      var main = element['weather'][0]['main'];
      var temp = element['temp']['day'];
      return WeatherSummaryModel(dt, dtLable, icon, temp, main);
    }).toList();

    List<dynamic> weeklyData = json['daily'];
    List<WeatherSummaryModel> weekly = weeklyData.map((element) {
      var dt = DateFormat.jm().format(DateTime.now());
      var dtLable = "PM";
      var icon = element['weather'][0]['icon'];
      var main = element['weather'][0]['main'];
      var temp = element['temp']['day'];
      return WeatherSummaryModel(dt, dtLable, icon, temp, main);
    }).toList();

    return WeatherCollection(
       WeatherDetailModel.fromJson(json),
      hourly,
      weekly,
    );
  }
}