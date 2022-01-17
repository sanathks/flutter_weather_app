import 'package:flutter/widgets.dart';
import 'package:weapp/model/weather_collection.dart';
import 'package:weapp/service/weather_data_service.dart';

class WeatherProvider  extends ChangeNotifier {

   Future<WeatherCollection> fetch() {
     return WeatherDataService.fetchAllData();
   }
}