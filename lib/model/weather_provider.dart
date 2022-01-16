import 'package:flutter/widgets.dart';
import 'package:weapp/model/weather_collection.dart';
import 'package:weapp/service/weather_data_service.dart';

class WeatherProvider  extends ChangeNotifier {
   late WeatherCollection _collection ;

   WeatherCollection get data => _collection;

   Future<void> fetch() async {
     _collection = await  WeatherDataService.fetchAllData();
     notifyListeners();
   }
}