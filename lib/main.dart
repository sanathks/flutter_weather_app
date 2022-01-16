import 'package:flutter/material.dart';
import 'package:weapp/model/weather_provider.dart';
import 'package:weapp/page/home.dart';
import 'package:provider/provider.dart';
import 'package:weapp/service/weather_data_service.dart';


void main() {
  runApp(
    ChangeNotifierProvider<WeatherProvider>(
      create: (context) => WeatherProvider(),
      child: const WeatherApp(),
    ),
  );
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Provider.of<WeatherProvider>(context, listen: false).fetch();
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
